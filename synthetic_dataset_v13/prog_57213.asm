; DESCRIPTION: Composite: Draws a orange circle centered at (134, 74) with radius 64 then Renders a black line between points (182, 226) and (186, 213) then Places a magenta dot at position (378, 230).
; PLAN: r0=134(x), r1=74(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x1), r6=226(y1), r7=186(x2), r8=213(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=230(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 134
LDI r1, 74
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 226
LDI r7, 186
LDI r8, 213
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 230
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
