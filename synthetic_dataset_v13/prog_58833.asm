; DESCRIPTION: Composite: Renders a red disk with center (110, 198) and radius 32 then Places a green line segment connecting (352, 231) to (453, 216) then Sets a single black pixel at (225, 174).
; PLAN: r0=110(x), r1=198(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x1), r6=231(y1), r7=453(x2), r8=216(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=174(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 110
LDI r1, 198
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 231
LDI r7, 453
LDI r8, 216
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 174
LDI r12, 0x000000
PSET r10, r11, r12
HALT
