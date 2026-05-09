; DESCRIPTION: Composite: Places a orange 12x113 rectangle at position (364, 134) then Draws a red line from (413, 150) to (290, 225) then Places a blue circle of radius 29 at center (233, 171).
; PLAN: r0=364(x), r1=134(y), r2=12(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x1), r6=150(y1), r7=290(x2), r8=225(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=171(y), r12=29(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 134
LDI r2, 12
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 150
LDI r7, 290
LDI r8, 225
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 171
LDI r12, 29
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
