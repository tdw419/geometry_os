; DESCRIPTION: Renders a yellow box of size 112x60 starting at (331, 185).
; PLAN: r0=331(x), r1=185(y), r2=112(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 185
LDI r2, 112
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
