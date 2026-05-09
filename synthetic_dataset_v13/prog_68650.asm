; DESCRIPTION: Composite: Places a green 55x23 rectangle at position (289, 211) then Creates a cyan circular shape at (306, 88) with radius 19 then Places a magenta dot at position (470, 110).
; PLAN: r0=289(x), r1=211(y), r2=55(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=88(y), r7=19(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=470(x), r11=110(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 211
LDI r2, 55
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 88
LDI r7, 19
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 470
LDI r11, 110
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
