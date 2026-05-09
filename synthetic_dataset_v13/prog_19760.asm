; DESCRIPTION: Composite: Renders a black line between points (99, 128) and (473, 9) then Places a cyan circle of radius 19 at center (489, 167) then Places a red dot at position (123, 12).
; PLAN: r0=99(x1), r1=128(y1), r2=473(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=489(x), r6=167(y), r7=19(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x), r11=12(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 99
LDI r1, 128
LDI r2, 473
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 167
LDI r7, 19
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 12
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
