; DESCRIPTION: Composite: Renders a black box of size 27x70 starting at (253, 63) then Renders a cyan disk with center (95, 102) and radius 40 then Renders a magenta line between points (175, 252) and (469, 251).
; PLAN: r0=253(x), r1=63(y), r2=27(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=102(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x1), r11=252(y1), r12=469(x2), r13=251(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 63
LDI r2, 27
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 102
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 252
LDI r12, 469
LDI r13, 251
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
