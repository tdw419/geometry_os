; DESCRIPTION: Composite: Draws a orange circle centered at (166, 190) with radius 38 then Renders a cyan line between points (338, 124) and (255, 24) then Places a yellow dot at position (105, 223).
; PLAN: r0=166(x), r1=190(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x1), r6=124(y1), r7=255(x2), r8=24(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=223(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 166
LDI r1, 190
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 124
LDI r7, 255
LDI r8, 24
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 223
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
