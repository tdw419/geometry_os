; DESCRIPTION: Composite: Creates a yellow rectangular region at (4, 22) spanning 60 by 82 pixels then Renders a green disk with center (406, 74) and radius 72 then Places a white line segment connecting (486, 252) to (146, 52).
; PLAN: r0=4(x), r1=22(y), r2=60(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x), r6=74(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x1), r11=252(y1), r12=146(x2), r13=52(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 4
LDI r1, 22
LDI r2, 60
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 74
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 252
LDI r12, 146
LDI r13, 52
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
