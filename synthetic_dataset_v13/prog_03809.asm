; DESCRIPTION: Composite: Places a cyan dot at position (254, 249) then Places a cyan line segment connecting (468, 99) to (85, 226) then Places a purple circle of radius 26 at center (225, 29).
; PLAN: r0=254(x), r1=249(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=468(x1), r6=99(y1), r7=85(x2), r8=226(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=29(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 254
LDI r1, 249
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 468
LDI r6, 99
LDI r7, 85
LDI r8, 226
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 29
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
