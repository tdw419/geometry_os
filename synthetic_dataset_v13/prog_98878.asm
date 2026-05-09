; DESCRIPTION: Renders a blue box of size 89x32 starting at (11, 79).
; PLAN: r0=11(x), r1=79(y), r2=89(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 79
LDI r2, 89
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
