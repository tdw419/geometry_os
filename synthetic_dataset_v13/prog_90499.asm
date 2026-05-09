; DESCRIPTION: Places a cyan 68x102 rectangle at position (220, 25).
; PLAN: r0=220(x), r1=25(y), r2=68(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 25
LDI r2, 68
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
