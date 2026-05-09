; DESCRIPTION: Composite: Renders a black line between points (324, 85) and (407, 93) then Renders a white disk with center (117, 156) and radius 76 then Places a cyan 38x36 rectangle at position (21, 196).
; PLAN: r0=324(x1), r1=85(y1), r2=407(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=156(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=21(x), r11=196(y), r12=38(width), r13=36(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 85
LDI r2, 407
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 156
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 21
LDI r11, 196
LDI r12, 38
LDI r13, 36
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
