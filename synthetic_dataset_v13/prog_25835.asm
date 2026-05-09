; DESCRIPTION: Composite: Renders a cyan disk with center (416, 176) and radius 12 then Draws a yellow line from (276, 104) to (451, 84) then Sets a single green pixel at (238, 52).
; PLAN: r0=416(x), r1=176(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x1), r6=104(y1), r7=451(x2), r8=84(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=238(x), r11=52(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 176
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 104
LDI r7, 451
LDI r8, 84
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 52
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
