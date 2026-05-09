; DESCRIPTION: Composite: Draws a cyan rectangle at (102, 154) with width 117 and height 79 then Creates a green circular shape at (208, 130) with radius 12.
; PLAN: r0=102(x), r1=154(y), r2=117(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=130(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 154
LDI r2, 117
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 130
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
