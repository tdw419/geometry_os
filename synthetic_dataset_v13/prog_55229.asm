; DESCRIPTION: Composite: Creates a green rectangular region at (95, 21) spanning 119 by 24 pixels then Renders a white line between points (117, 125) and (291, 124) then Places a yellow circle of radius 47 at center (230, 50).
; PLAN: r0=95(x), r1=21(y), r2=119(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x1), r6=125(y1), r7=291(x2), r8=124(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=50(y), r12=47(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 95
LDI r1, 21
LDI r2, 119
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 125
LDI r7, 291
LDI r8, 124
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 50
LDI r12, 47
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
