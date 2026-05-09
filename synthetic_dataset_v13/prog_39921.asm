; DESCRIPTION: Composite: Draws a white line from (419, 49) to (121, 46) then Draws a purple circle centered at (344, 98) with radius 66 then Sets a single black pixel at (224, 12).
; PLAN: r0=419(x1), r1=49(y1), r2=121(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=98(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=224(x), r11=12(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 419
LDI r1, 49
LDI r2, 121
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 98
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 224
LDI r11, 12
LDI r12, 0x000000
PSET r10, r11, r12
HALT
