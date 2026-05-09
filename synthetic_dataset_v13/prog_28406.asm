; DESCRIPTION: Composite: Draws a magenta rectangle at (229, 163) with width 68 and height 22 then Renders a green line between points (403, 47) and (358, 142) then Renders a green disk with center (216, 98) and radius 59.
; PLAN: r0=229(x), r1=163(y), r2=68(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x1), r6=47(y1), r7=358(x2), r8=142(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=98(y), r12=59(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 229
LDI r1, 163
LDI r2, 68
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 47
LDI r7, 358
LDI r8, 142
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 98
LDI r12, 59
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
