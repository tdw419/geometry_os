; DESCRIPTION: Composite: Sets a single cyan pixel at (245, 153) then Draws a white rectangle at (136, 128) with width 22 and height 35 then Renders a green disk with center (394, 86) and radius 56.
; PLAN: r0=245(x), r1=153(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=128(y), r7=22(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x), r11=86(y), r12=56(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 153
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 136
LDI r6, 128
LDI r7, 22
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 86
LDI r12, 56
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
