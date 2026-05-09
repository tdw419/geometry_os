; DESCRIPTION: Composite: Renders a blue box of size 37x22 starting at (283, 35) then Creates a white circular shape at (343, 101) with radius 39 then Places a cyan dot at position (188, 210).
; PLAN: r0=283(x), r1=35(y), r2=37(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x), r6=101(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=188(x), r11=210(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 35
LDI r2, 37
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 101
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 188
LDI r11, 210
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
