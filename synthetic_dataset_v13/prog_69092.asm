; DESCRIPTION: Composite: Creates a white rectangular region at (266, 53) spanning 59 by 116 pixels then Draws a red line from (297, 90) to (396, 26) then Places a red circle of radius 71 at center (303, 139).
; PLAN: r0=266(x), r1=53(y), r2=59(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x1), r6=90(y1), r7=396(x2), r8=26(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=139(y), r12=71(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 266
LDI r1, 53
LDI r2, 59
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 90
LDI r7, 396
LDI r8, 26
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 139
LDI r12, 71
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
