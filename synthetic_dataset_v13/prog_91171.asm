; DESCRIPTION: Composite: Places a red line segment connecting (260, 174) to (371, 230) then Sets a single purple pixel at (269, 12) then Renders a white box of size 112x55 starting at (140, 65).
; PLAN: r0=260(x1), r1=174(y1), r2=371(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=12(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=140(x), r11=65(y), r12=112(width), r13=55(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 174
LDI r2, 371
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 12
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 140
LDI r11, 65
LDI r12, 112
LDI r13, 55
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
