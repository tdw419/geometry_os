; DESCRIPTION: Composite: Draws a white circle centered at (80, 129) with radius 68 then Renders a blue box of size 48x13 starting at (136, 145) then Sets a single green pixel at (102, 246).
; PLAN: r0=80(x), r1=129(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x), r6=145(y), r7=48(width), r8=13(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=102(x), r11=246(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 129
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 145
LDI r7, 48
LDI r8, 13
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 246
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
