; DESCRIPTION: Composite: Draws a orange circle centered at (71, 231) with radius 25 then Places a purple line segment connecting (357, 41) to (505, 113) then Places a green dot at position (271, 218).
; PLAN: r0=71(x), r1=231(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x1), r6=41(y1), r7=505(x2), r8=113(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=218(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 71
LDI r1, 231
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 41
LDI r7, 505
LDI r8, 113
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 218
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
