; DESCRIPTION: Composite: Creates a white rectangular region at (163, 84) spanning 93 by 111 pixels then Places a red circle of radius 37 at center (374, 39) then Renders a white line between points (240, 212) and (116, 205).
; PLAN: r0=163(x), r1=84(y), r2=93(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=39(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=240(x1), r11=212(y1), r12=116(x2), r13=205(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 84
LDI r2, 93
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 39
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 240
LDI r11, 212
LDI r12, 116
LDI r13, 205
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
