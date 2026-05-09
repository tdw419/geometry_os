; DESCRIPTION: Composite: Draws a red circle centered at (54, 172) with radius 42 then Renders a yellow box of size 18x119 starting at (242, 133) then Renders a red line between points (453, 226) and (69, 14).
; PLAN: r0=54(x), r1=172(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=242(x), r6=133(y), r7=18(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=453(x1), r11=226(y1), r12=69(x2), r13=14(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 172
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 242
LDI r6, 133
LDI r7, 18
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 226
LDI r12, 69
LDI r13, 14
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
