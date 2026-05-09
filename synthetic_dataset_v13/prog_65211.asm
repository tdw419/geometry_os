; DESCRIPTION: Composite: Sets a single yellow pixel at (106, 128) then Creates a cyan circular shape at (113, 122) with radius 11 then Renders a black line between points (54, 148) and (95, 22).
; PLAN: r0=106(x), r1=128(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=113(x), r6=122(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=54(x1), r11=148(y1), r12=95(x2), r13=22(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 128
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 113
LDI r6, 122
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 54
LDI r11, 148
LDI r12, 95
LDI r13, 22
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
