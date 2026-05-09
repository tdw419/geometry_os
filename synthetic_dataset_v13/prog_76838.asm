; DESCRIPTION: Composite: Creates a magenta rectangular region at (38, 77) spanning 47 by 120 pixels then Draws a yellow circle centered at (233, 204) with radius 17 then Renders a black line between points (374, 30) and (203, 27).
; PLAN: r0=38(x), r1=77(y), r2=47(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=204(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x1), r11=30(y1), r12=203(x2), r13=27(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 77
LDI r2, 47
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 204
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 30
LDI r12, 203
LDI r13, 27
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
