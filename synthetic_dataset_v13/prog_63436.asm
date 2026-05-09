; DESCRIPTION: Composite: Draws a white line from (50, 94) to (373, 151) then Creates a orange circular shape at (400, 118) with radius 76 then Sets a single cyan pixel at (375, 102).
; PLAN: r0=50(x1), r1=94(y1), r2=373(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=118(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=375(x), r11=102(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 94
LDI r2, 373
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 118
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 375
LDI r11, 102
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
