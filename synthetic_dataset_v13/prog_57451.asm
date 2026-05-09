; DESCRIPTION: Composite: Draws a green circle centered at (210, 84) with radius 44 then Places a cyan line segment connecting (306, 113) to (151, 190) then Sets a single cyan pixel at (81, 102).
; PLAN: r0=210(x), r1=84(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x1), r6=113(y1), r7=151(x2), r8=190(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=81(x), r11=102(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 210
LDI r1, 84
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 113
LDI r7, 151
LDI r8, 190
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 102
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
