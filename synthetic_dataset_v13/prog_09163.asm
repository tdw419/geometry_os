; DESCRIPTION: Composite: Places a green line segment connecting (211, 34) to (498, 193) then Creates a cyan circular shape at (409, 154) with radius 50 then Places a black dot at position (489, 162).
; PLAN: r0=211(x1), r1=34(y1), r2=498(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=154(y), r7=50(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=489(x), r11=162(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 34
LDI r2, 498
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 154
LDI r7, 50
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 489
LDI r11, 162
LDI r12, 0x000000
PSET r10, r11, r12
HALT
