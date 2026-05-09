; DESCRIPTION: Composite: Renders a magenta line between points (181, 0) and (375, 144) then Draws a white rectangle at (350, 137) with width 82 and height 25 then Places a purple dot at position (292, 204).
; PLAN: r0=181(x1), r1=0(y1), r2=375(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=137(y), r7=82(width), r8=25(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=292(x), r11=204(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 181
LDI r1, 0
LDI r2, 375
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 137
LDI r7, 82
LDI r8, 25
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 204
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
