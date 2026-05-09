; DESCRIPTION: Composite: Renders a purple line between points (226, 10) and (388, 42) then Draws a red circle centered at (156, 113) with radius 77 then Renders a white box of size 47x54 starting at (418, 143).
; PLAN: r0=226(x1), r1=10(y1), r2=388(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=113(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=418(x), r11=143(y), r12=47(width), r13=54(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 226
LDI r1, 10
LDI r2, 388
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 113
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 418
LDI r11, 143
LDI r12, 47
LDI r13, 54
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
