; DESCRIPTION: Composite: Creates a cyan circular shape at (398, 113) with radius 25 then Sets a single cyan pixel at (87, 23) then Renders a blue box of size 101x104 starting at (138, 140).
; PLAN: r0=398(x), r1=113(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=23(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=138(x), r11=140(y), r12=101(width), r13=104(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 113
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 23
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 138
LDI r11, 140
LDI r12, 101
LDI r13, 104
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
