; DESCRIPTION: Composite: Renders a white disk with center (343, 110) and radius 65 then Draws a white line from (283, 58) to (377, 231) then Sets a single cyan pixel at (360, 137).
; PLAN: r0=343(x), r1=110(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x1), r6=58(y1), r7=377(x2), r8=231(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=137(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 110
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 58
LDI r7, 377
LDI r8, 231
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 137
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
