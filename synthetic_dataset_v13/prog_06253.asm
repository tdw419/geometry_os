; DESCRIPTION: Composite: Places a orange line segment connecting (393, 90) to (191, 38) then Creates a cyan circular shape at (328, 186) with radius 12 then Places a red dot at position (6, 194).
; PLAN: r0=393(x1), r1=90(y1), r2=191(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=186(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=6(x), r11=194(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 90
LDI r2, 191
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 186
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 6
LDI r11, 194
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
