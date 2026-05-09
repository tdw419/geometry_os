; DESCRIPTION: Composite: Draws a yellow rectangle at (108, 185) with width 72 and height 48 then Renders a red disk with center (374, 196) and radius 39.
; PLAN: r0=108(x), r1=185(y), r2=72(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=196(y), r7=39(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 108
LDI r1, 185
LDI r2, 72
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 196
LDI r7, 39
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
