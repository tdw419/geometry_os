; DESCRIPTION: Composite: Places a orange line segment connecting (367, 93) to (502, 216) then Creates a purple rectangular region at (204, 182) spanning 81 by 53 pixels then Places a white circle of radius 55 at center (360, 148).
; PLAN: r0=367(x1), r1=93(y1), r2=502(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=182(y), r7=81(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=360(x), r11=148(y), r12=55(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 367
LDI r1, 93
LDI r2, 502
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 182
LDI r7, 81
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 148
LDI r12, 55
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
