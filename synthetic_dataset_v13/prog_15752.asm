; DESCRIPTION: Renders a magenta box of size 17x59 starting at (400, 110).
; PLAN: r0=400(x), r1=110(y), r2=17(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 110
LDI r2, 17
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
