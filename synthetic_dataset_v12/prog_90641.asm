; DESCRIPTION: Composite: Renders a magenta disk with center (224, 81) and radius 65 then Draws a green rectangle at (140, 160) with width 113 and height 60 then Sets a single purple pixel at (453, 114).
; PLAN: r0=224(x), r1=81(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=160(y), r7=113(width), r8=60(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=453(x), r11=114(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 224
LDI r1, 81
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 160
LDI r7, 113
LDI r8, 60
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 114
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
