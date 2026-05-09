; DESCRIPTION: Composite: Renders a yellow disk with center (111, 134) and radius 31 then Draws a red line from (30, 65) to (291, 199) then Creates a yellow rectangular region at (62, 108) spanning 74 by 107 pixels.
; PLAN: r0=111(x), r1=134(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=65(y1), r7=291(x2), r8=199(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=108(y), r12=74(width), r13=107(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 134
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 65
LDI r7, 291
LDI r8, 199
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 108
LDI r12, 74
LDI r13, 107
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
