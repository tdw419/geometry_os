; DESCRIPTION: Composite: Renders a red disk with center (144, 177) and radius 59 then Renders a white line between points (456, 150) and (251, 135) then Draws a white rectangle at (115, 34) with width 43 and height 68.
; PLAN: r0=144(x), r1=177(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x1), r6=150(y1), r7=251(x2), r8=135(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=34(y), r12=43(width), r13=68(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 177
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 150
LDI r7, 251
LDI r8, 135
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 34
LDI r12, 43
LDI r13, 68
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
