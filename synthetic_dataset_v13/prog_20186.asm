; DESCRIPTION: Composite: Renders a white line between points (56, 242) and (478, 145) then Renders a red disk with center (107, 180) and radius 76 then Places a magenta 91x15 rectangle at position (296, 188).
; PLAN: r0=56(x1), r1=242(y1), r2=478(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=180(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=296(x), r11=188(y), r12=91(width), r13=15(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 242
LDI r2, 478
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 180
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 296
LDI r11, 188
LDI r12, 91
LDI r13, 15
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
