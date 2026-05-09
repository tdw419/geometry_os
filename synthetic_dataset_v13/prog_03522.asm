; DESCRIPTION: Composite: Renders a cyan disk with center (143, 192) and radius 61 then Renders a green line between points (163, 66) and (266, 145) then Renders a red box of size 53x52 starting at (17, 118).
; PLAN: r0=143(x), r1=192(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x1), r6=66(y1), r7=266(x2), r8=145(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=17(x), r11=118(y), r12=53(width), r13=52(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 192
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 66
LDI r7, 266
LDI r8, 145
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 17
LDI r11, 118
LDI r12, 53
LDI r13, 52
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
