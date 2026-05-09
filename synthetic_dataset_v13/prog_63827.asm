; DESCRIPTION: Composite: Places a blue line segment connecting (457, 108) to (395, 190) then Creates a red circular shape at (217, 79) with radius 50 then Places a purple dot at position (190, 160).
; PLAN: r0=457(x1), r1=108(y1), r2=395(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=79(y), r7=50(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=190(x), r11=160(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 457
LDI r1, 108
LDI r2, 395
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 79
LDI r7, 50
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 190
LDI r11, 160
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
