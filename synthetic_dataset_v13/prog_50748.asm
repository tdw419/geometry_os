; DESCRIPTION: Places a cyan 68x61 rectangle at position (75, 112).
; PLAN: r0=75(x), r1=112(y), r2=68(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 112
LDI r2, 68
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
