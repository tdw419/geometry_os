; DESCRIPTION: Composite: Creates a red rectangular region at (197, 40) spanning 74 by 44 pixels then Draws a blue circle centered at (337, 105) with radius 59 then Renders a yellow line between points (335, 10) and (303, 134).
; PLAN: r0=197(x), r1=40(y), r2=74(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=105(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x1), r11=10(y1), r12=303(x2), r13=134(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 40
LDI r2, 74
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 105
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 10
LDI r12, 303
LDI r13, 134
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
