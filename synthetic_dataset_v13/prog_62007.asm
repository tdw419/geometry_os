; DESCRIPTION: Composite: Places a purple line segment connecting (493, 40) to (21, 226) then Renders a green disk with center (180, 67) and radius 15.
; PLAN: r0=493(x1), r1=40(y1), r2=21(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=67(y), r7=15(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 493
LDI r1, 40
LDI r2, 21
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 67
LDI r7, 15
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
