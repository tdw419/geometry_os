; DESCRIPTION: Composite: Draws a orange line from (373, 190) to (419, 156) then Draws a white circle centered at (215, 110) with radius 37 then Sets a single white pixel at (70, 60).
; PLAN: r0=373(x1), r1=190(y1), r2=419(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=110(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=70(x), r11=60(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 373
LDI r1, 190
LDI r2, 419
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 110
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 70
LDI r11, 60
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
