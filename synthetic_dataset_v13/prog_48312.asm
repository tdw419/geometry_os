; DESCRIPTION: Renders a blue box of size 35x32 starting at (47, 164).
; PLAN: r0=47(x), r1=164(y), r2=35(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 164
LDI r2, 35
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
