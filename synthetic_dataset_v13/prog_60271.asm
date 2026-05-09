; DESCRIPTION: Composite: Sets a single blue pixel at (27, 174) then Creates a cyan circular shape at (270, 110) with radius 80 then Places a green 22x45 rectangle at position (143, 101).
; PLAN: r0=27(x), r1=174(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=110(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=101(y), r12=22(width), r13=45(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 174
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 270
LDI r6, 110
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 101
LDI r12, 22
LDI r13, 45
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
