; DESCRIPTION: Composite: Renders a white box of size 99x107 starting at (22, 80) then Sets a single orange pixel at (107, 196) then Renders a cyan disk with center (135, 83) and radius 27.
; PLAN: r0=22(x), r1=80(y), r2=99(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x), r6=196(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=135(x), r11=83(y), r12=27(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 22
LDI r1, 80
LDI r2, 99
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 196
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 135
LDI r11, 83
LDI r12, 27
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
