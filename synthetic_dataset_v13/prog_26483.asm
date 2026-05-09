; DESCRIPTION: Composite: Renders a cyan line between points (83, 12) and (22, 100) then Places a yellow circle of radius 55 at center (281, 177) then Places a black 105x119 rectangle at position (306, 80).
; PLAN: r0=83(x1), r1=12(y1), r2=22(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=177(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=80(y), r12=105(width), r13=119(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 12
LDI r2, 22
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 177
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 80
LDI r12, 105
LDI r13, 119
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
