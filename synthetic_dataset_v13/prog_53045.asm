; DESCRIPTION: Composite: Renders a green line between points (460, 55) and (370, 51) then Places a cyan dot at position (413, 172) then Draws a cyan circle centered at (309, 145) with radius 74.
; PLAN: r0=460(x1), r1=55(y1), r2=370(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=172(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=309(x), r11=145(y), r12=74(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 55
LDI r2, 370
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 172
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 309
LDI r11, 145
LDI r12, 74
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
