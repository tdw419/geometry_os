; DESCRIPTION: Composite: Renders a yellow disk with center (346, 169) and radius 57 then Draws a black rectangle at (332, 133) with width 99 and height 106.
; PLAN: r0=346(x), r1=169(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=133(y), r7=99(width), r8=106(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 169
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 133
LDI r7, 99
LDI r8, 106
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
