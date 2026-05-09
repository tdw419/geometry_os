; DESCRIPTION: Composite: Draws a orange rectangle at (65, 136) with width 53 and height 57 then Renders a magenta line between points (246, 38) and (361, 150) then Sets a single cyan pixel at (343, 131).
; PLAN: r0=65(x), r1=136(y), r2=53(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x1), r6=38(y1), r7=361(x2), r8=150(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=343(x), r11=131(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 136
LDI r2, 53
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 38
LDI r7, 361
LDI r8, 150
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 131
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
