; DESCRIPTION: Composite: Draws a white line from (117, 2) to (316, 120) then Renders a magenta box of size 75x82 starting at (150, 89) then Draws a blue circle centered at (195, 141) with radius 66.
; PLAN: r0=117(x1), r1=2(y1), r2=316(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=89(y), r7=75(width), r8=82(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=195(x), r11=141(y), r12=66(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 117
LDI r1, 2
LDI r2, 316
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 89
LDI r7, 75
LDI r8, 82
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 141
LDI r12, 66
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
