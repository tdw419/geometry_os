; DESCRIPTION: Composite: Creates a blue circular shape at (205, 203) with radius 19 then Draws a green line from (73, 159) to (337, 102) then Places a yellow dot at position (186, 66).
; PLAN: r0=205(x), r1=203(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x1), r6=159(y1), r7=337(x2), r8=102(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=186(x), r11=66(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 203
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 159
LDI r7, 337
LDI r8, 102
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 66
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
