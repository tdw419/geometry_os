; DESCRIPTION: Composite: Renders a yellow line between points (442, 60) and (279, 17) then Creates a cyan circular shape at (143, 88) with radius 55.
; PLAN: r0=442(x1), r1=60(y1), r2=279(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=88(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 442
LDI r1, 60
LDI r2, 279
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 88
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
