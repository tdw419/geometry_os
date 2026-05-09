; DESCRIPTION: Composite: Creates a cyan rectangular region at (4, 68) spanning 28 by 12 pixels then Renders a yellow line between points (68, 220) and (318, 174) then Renders a purple disk with center (436, 67) and radius 46.
; PLAN: r0=4(x), r1=68(y), r2=28(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x1), r6=220(y1), r7=318(x2), r8=174(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=436(x), r11=67(y), r12=46(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 4
LDI r1, 68
LDI r2, 28
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 220
LDI r7, 318
LDI r8, 174
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 67
LDI r12, 46
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
