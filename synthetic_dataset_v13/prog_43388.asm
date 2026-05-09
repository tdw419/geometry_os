; DESCRIPTION: Composite: Creates a red circular shape at (115, 51) with radius 43 then Renders a cyan line between points (261, 28) and (379, 252) then Creates a black rectangular region at (52, 3) spanning 76 by 63 pixels.
; PLAN: r0=115(x), r1=51(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x1), r6=28(y1), r7=379(x2), r8=252(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=52(x), r11=3(y), r12=76(width), r13=63(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 51
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 28
LDI r7, 379
LDI r8, 252
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 3
LDI r12, 76
LDI r13, 63
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
