; DESCRIPTION: Renders a blue box of size 92x40 starting at (277, 199).
; PLAN: r0=277(x), r1=199(y), r2=92(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 199
LDI r2, 92
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
