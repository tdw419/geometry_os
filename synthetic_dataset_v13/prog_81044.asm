; DESCRIPTION: Composite: Draws a yellow rectangle at (223, 130) with width 112 and height 98 then Renders a green line between points (444, 135) and (426, 158).
; PLAN: r0=223(x), r1=130(y), r2=112(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x1), r6=135(y1), r7=426(x2), r8=158(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 130
LDI r2, 112
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 135
LDI r7, 426
LDI r8, 158
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
