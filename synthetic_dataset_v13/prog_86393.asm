; DESCRIPTION: Composite: Places a purple line segment connecting (79, 127) to (300, 191) then Renders a cyan disk with center (352, 88) and radius 67.
; PLAN: r0=79(x1), r1=127(y1), r2=300(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=88(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 79
LDI r1, 127
LDI r2, 300
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 88
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
