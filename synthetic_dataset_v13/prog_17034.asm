; DESCRIPTION: Composite: Creates a cyan circular shape at (364, 173) with radius 52 then Draws a purple line from (492, 86) to (314, 200) then Places a black dot at position (290, 108).
; PLAN: r0=364(x), r1=173(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x1), r6=86(y1), r7=314(x2), r8=200(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=290(x), r11=108(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 364
LDI r1, 173
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 86
LDI r7, 314
LDI r8, 200
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 108
LDI r12, 0x000000
PSET r10, r11, r12
HALT
