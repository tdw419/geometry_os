; DESCRIPTION: Composite: Creates a red circular shape at (185, 106) with radius 76 then Creates a white rectangular region at (184, 38) spanning 37 by 92 pixels then Renders a red line between points (277, 132) and (367, 132).
; PLAN: r0=185(x), r1=106(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=38(y), r7=37(width), r8=92(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=277(x1), r11=132(y1), r12=367(x2), r13=132(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 106
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 38
LDI r7, 37
LDI r8, 92
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 132
LDI r12, 367
LDI r13, 132
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
