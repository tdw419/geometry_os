; DESCRIPTION: Renders a blue box of size 110x24 starting at (277, 0).
; PLAN: r0=277(x), r1=0(y), r2=110(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 0
LDI r2, 110
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
