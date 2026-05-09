; DESCRIPTION: Composite: Creates a red rectangular region at (281, 119) spanning 11 by 13 pixels then Draws a cyan circle centered at (424, 129) with radius 29 then Draws a purple line from (333, 81) to (3, 141).
; PLAN: r0=281(x), r1=119(y), r2=11(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=129(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=333(x1), r11=81(y1), r12=3(x2), r13=141(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 119
LDI r2, 11
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 129
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 333
LDI r11, 81
LDI r12, 3
LDI r13, 141
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
