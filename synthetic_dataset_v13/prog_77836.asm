; DESCRIPTION: Composite: Creates a black rectangular region at (344, 194) spanning 93 by 57 pixels then Draws a red circle centered at (262, 228) with radius 17 then Renders a white line between points (317, 136) and (213, 17).
; PLAN: r0=344(x), r1=194(y), r2=93(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x), r6=228(y), r7=17(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=317(x1), r11=136(y1), r12=213(x2), r13=17(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 194
LDI r2, 93
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 228
LDI r7, 17
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 317
LDI r11, 136
LDI r12, 213
LDI r13, 17
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
