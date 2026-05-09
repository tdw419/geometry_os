; DESCRIPTION: Composite: Places a purple 110x86 rectangle at position (259, 118) then Places a orange circle of radius 52 at center (301, 130) then Renders a cyan line between points (117, 134) and (138, 51).
; PLAN: r0=259(x), r1=118(y), r2=110(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=130(y), r7=52(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x1), r11=134(y1), r12=138(x2), r13=51(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 118
LDI r2, 110
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 130
LDI r7, 52
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 134
LDI r12, 138
LDI r13, 51
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
