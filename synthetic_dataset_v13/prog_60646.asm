; DESCRIPTION: Composite: Renders a white line between points (236, 180) and (46, 240) then Draws a blue rectangle at (265, 95) with width 82 and height 118 then Creates a red circular shape at (160, 153) with radius 11.
; PLAN: r0=236(x1), r1=180(y1), r2=46(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=95(y), r7=82(width), r8=118(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=160(x), r11=153(y), r12=11(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 236
LDI r1, 180
LDI r2, 46
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 95
LDI r7, 82
LDI r8, 118
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 153
LDI r12, 11
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
