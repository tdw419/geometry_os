; DESCRIPTION: Composite: Draws a red line from (371, 75) to (359, 113) then Draws a green circle centered at (294, 120) with radius 65 then Sets a single purple pixel at (319, 172).
; PLAN: r0=371(x1), r1=75(y1), r2=359(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=120(y), r7=65(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=319(x), r11=172(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 75
LDI r2, 359
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 120
LDI r7, 65
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 319
LDI r11, 172
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
