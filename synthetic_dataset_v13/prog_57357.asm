; DESCRIPTION: Composite: Renders a green box of size 43x102 starting at (314, 115) then Draws a white line from (199, 139) to (246, 60) then Places a white circle of radius 42 at center (172, 180).
; PLAN: r0=314(x), r1=115(y), r2=43(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x1), r6=139(y1), r7=246(x2), r8=60(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=180(y), r12=42(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 314
LDI r1, 115
LDI r2, 43
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 139
LDI r7, 246
LDI r8, 60
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 180
LDI r12, 42
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
