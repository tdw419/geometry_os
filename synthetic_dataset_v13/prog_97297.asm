; DESCRIPTION: Composite: Draws a red circle centered at (455, 67) with radius 34 then Renders a blue line between points (49, 241) and (374, 135).
; PLAN: r0=455(x), r1=67(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x1), r6=241(y1), r7=374(x2), r8=135(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 67
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 241
LDI r7, 374
LDI r8, 135
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
