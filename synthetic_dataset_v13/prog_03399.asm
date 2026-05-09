; DESCRIPTION: Composite: Renders a red disk with center (132, 213) and radius 15 then Draws a blue line from (172, 103) to (186, 119) then Places a red dot at position (361, 196).
; PLAN: r0=132(x), r1=213(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x1), r6=103(y1), r7=186(x2), r8=119(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=361(x), r11=196(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 213
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 103
LDI r7, 186
LDI r8, 119
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 361
LDI r11, 196
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
