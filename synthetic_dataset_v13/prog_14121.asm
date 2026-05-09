; DESCRIPTION: Composite: Creates a blue rectangular region at (309, 38) spanning 18 by 118 pixels then Places a green line segment connecting (246, 196) to (342, 113) then Places a white dot at position (212, 246).
; PLAN: r0=309(x), r1=38(y), r2=18(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x1), r6=196(y1), r7=342(x2), r8=113(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=212(x), r11=246(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 309
LDI r1, 38
LDI r2, 18
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 196
LDI r7, 342
LDI r8, 113
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 246
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
