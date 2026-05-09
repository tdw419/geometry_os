; DESCRIPTION: Composite: Places a green circle of radius 67 at center (442, 124) then Places a cyan dot at position (144, 231) then Places a purple line segment connecting (188, 18) to (424, 127).
; PLAN: r0=442(x), r1=124(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=231(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=188(x1), r11=18(y1), r12=424(x2), r13=127(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 124
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 231
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 188
LDI r11, 18
LDI r12, 424
LDI r13, 127
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
