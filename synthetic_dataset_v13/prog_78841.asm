; DESCRIPTION: Composite: Draws a orange circle centered at (353, 112) with radius 47 then Draws a purple line from (34, 153) to (60, 217) then Places a blue dot at position (9, 128).
; PLAN: r0=353(x), r1=112(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x1), r6=153(y1), r7=60(x2), r8=217(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=9(x), r11=128(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 353
LDI r1, 112
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 153
LDI r7, 60
LDI r8, 217
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 9
LDI r11, 128
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
