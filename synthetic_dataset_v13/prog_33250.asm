; DESCRIPTION: Places a blue 89x73 rectangle at position (236, 19).
; PLAN: r0=236(x), r1=19(y), r2=89(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 19
LDI r2, 89
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
