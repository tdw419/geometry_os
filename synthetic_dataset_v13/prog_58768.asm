; DESCRIPTION: Composite: Renders a purple disk with center (202, 192) and radius 54 then Draws a yellow rectangle at (137, 36) with width 65 and height 50.
; PLAN: r0=202(x), r1=192(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x), r6=36(y), r7=65(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 192
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 36
LDI r7, 65
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
