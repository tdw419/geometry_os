; DESCRIPTION: Composite: Places a blue 117x119 rectangle at position (115, 118) then Creates a cyan circular shape at (75, 91) with radius 73 then Places a cyan line segment connecting (245, 99) to (488, 233).
; PLAN: r0=115(x), r1=118(y), r2=117(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=91(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x1), r11=99(y1), r12=488(x2), r13=233(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 118
LDI r2, 117
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 91
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 99
LDI r12, 488
LDI r13, 233
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
