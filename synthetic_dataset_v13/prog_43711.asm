; DESCRIPTION: Composite: Places a magenta circle of radius 65 at center (347, 180) then Draws a cyan line from (481, 66) to (266, 189) then Places a red dot at position (471, 84).
; PLAN: r0=347(x), r1=180(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x1), r6=66(y1), r7=266(x2), r8=189(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=471(x), r11=84(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 180
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 66
LDI r7, 266
LDI r8, 189
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 84
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
