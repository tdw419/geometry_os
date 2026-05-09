; DESCRIPTION: Composite: Renders a green line between points (22, 25) and (421, 64) then Creates a cyan circular shape at (109, 83) with radius 67 then Places a yellow dot at position (167, 205).
; PLAN: r0=22(x1), r1=25(y1), r2=421(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=83(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=167(x), r11=205(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 22
LDI r1, 25
LDI r2, 421
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 83
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 167
LDI r11, 205
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
