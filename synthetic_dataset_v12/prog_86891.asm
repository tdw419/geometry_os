; DESCRIPTION: Composite: Creates a white rectangular region at (260, 45) spanning 106 by 117 pixels then Renders a green disk with center (275, 56) and radius 25 then Places a green dot at position (144, 139).
; PLAN: r0=260(x), r1=45(y), r2=106(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=56(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=144(x), r11=139(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 260
LDI r1, 45
LDI r2, 106
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 56
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 144
LDI r11, 139
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
