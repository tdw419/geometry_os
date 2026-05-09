; DESCRIPTION: Composite: Draws a orange rectangle at (175, 180) with width 36 and height 24 then Renders a magenta line between points (251, 2) and (354, 8) then Places a orange circle of radius 31 at center (159, 212).
; PLAN: r0=175(x), r1=180(y), r2=36(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x1), r6=2(y1), r7=354(x2), r8=8(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=212(y), r12=31(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 180
LDI r2, 36
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 2
LDI r7, 354
LDI r8, 8
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 212
LDI r12, 31
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
