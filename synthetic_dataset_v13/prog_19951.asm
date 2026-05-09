; DESCRIPTION: Composite: Sets a single red pixel at (44, 39) then Renders a purple box of size 54x113 starting at (114, 58) then Places a red line segment connecting (290, 188) to (308, 10).
; PLAN: r0=44(x), r1=39(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=114(x), r6=58(y), r7=54(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x1), r11=188(y1), r12=308(x2), r13=10(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 39
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 114
LDI r6, 58
LDI r7, 54
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 188
LDI r12, 308
LDI r13, 10
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
