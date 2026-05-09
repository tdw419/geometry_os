; DESCRIPTION: Places a cyan 92x61 rectangle at position (73, 63).
; PLAN: r0=73(x), r1=63(y), r2=92(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 63
LDI r2, 92
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
