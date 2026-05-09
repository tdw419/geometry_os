; DESCRIPTION: Composite: Draws a yellow rectangle at (186, 32) with width 39 and height 32 then Places a purple line segment connecting (341, 130) to (91, 119).
; PLAN: r0=186(x), r1=32(y), r2=39(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x1), r6=130(y1), r7=91(x2), r8=119(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 32
LDI r2, 39
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 130
LDI r7, 91
LDI r8, 119
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
