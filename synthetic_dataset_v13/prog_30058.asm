; DESCRIPTION: Composite: Creates a purple circular shape at (171, 125) with radius 77 then Draws a cyan rectangle at (25, 156) with width 50 and height 37 then Renders a green line between points (195, 44) and (429, 186).
; PLAN: r0=171(x), r1=125(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=156(y), r7=50(width), r8=37(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=195(x1), r11=44(y1), r12=429(x2), r13=186(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 125
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 156
LDI r7, 50
LDI r8, 37
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 44
LDI r12, 429
LDI r13, 186
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
