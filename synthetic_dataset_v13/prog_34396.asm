; DESCRIPTION: Composite: Creates a cyan rectangular region at (287, 86) spanning 24 by 120 pixels then Places a purple line segment connecting (88, 190) to (285, 177) then Places a white circle of radius 50 at center (308, 69).
; PLAN: r0=287(x), r1=86(y), r2=24(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x1), r6=190(y1), r7=285(x2), r8=177(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=69(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 86
LDI r2, 24
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 190
LDI r7, 285
LDI r8, 177
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 69
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
