; DESCRIPTION: Composite: Renders a yellow line between points (109, 142) and (355, 138) then Draws a purple rectangle at (243, 168) with width 99 and height 25 then Renders a cyan disk with center (303, 112) and radius 55.
; PLAN: r0=109(x1), r1=142(y1), r2=355(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=168(y), r7=99(width), r8=25(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=303(x), r11=112(y), r12=55(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 109
LDI r1, 142
LDI r2, 355
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 168
LDI r7, 99
LDI r8, 25
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 112
LDI r12, 55
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
