; DESCRIPTION: Renders a blue box of size 10x20 starting at (441, 5).
; PLAN: r0=441(x), r1=5(y), r2=10(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 5
LDI r2, 10
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
