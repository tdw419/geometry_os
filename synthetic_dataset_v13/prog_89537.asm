; DESCRIPTION: Composite: Draws a green rectangle at (319, 171) with width 37 and height 24 then Draws a red line from (212, 228) to (224, 212) then Renders a blue disk with center (119, 104) and radius 79.
; PLAN: r0=319(x), r1=171(y), r2=37(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x1), r6=228(y1), r7=224(x2), r8=212(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=119(x), r11=104(y), r12=79(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 319
LDI r1, 171
LDI r2, 37
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 228
LDI r7, 224
LDI r8, 212
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 104
LDI r12, 79
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
