; DESCRIPTION: Composite: Places a orange 41x88 rectangle at position (72, 49) then Renders a cyan disk with center (401, 99) and radius 41 then Renders a purple line between points (253, 112) and (40, 117).
; PLAN: r0=72(x), r1=49(y), r2=41(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=99(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=253(x1), r11=112(y1), r12=40(x2), r13=117(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 49
LDI r2, 41
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 99
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 253
LDI r11, 112
LDI r12, 40
LDI r13, 117
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
