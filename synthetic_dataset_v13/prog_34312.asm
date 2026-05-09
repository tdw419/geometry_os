; DESCRIPTION: Composite: Places a purple line segment connecting (11, 218) to (346, 35) then Renders a blue disk with center (82, 152) and radius 74.
; PLAN: r0=11(x1), r1=218(y1), r2=346(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=152(y), r7=74(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 11
LDI r1, 218
LDI r2, 346
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 152
LDI r7, 74
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
