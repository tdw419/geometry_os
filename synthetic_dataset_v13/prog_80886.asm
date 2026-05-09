; DESCRIPTION: Composite: Renders a red disk with center (401, 130) and radius 80 then Draws a blue rectangle at (236, 88) with width 63 and height 88.
; PLAN: r0=401(x), r1=130(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=88(y), r7=63(width), r8=88(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 130
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 88
LDI r7, 63
LDI r8, 88
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
