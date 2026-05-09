; DESCRIPTION: Composite: Renders a red line between points (439, 155) and (372, 17) then Renders a black box of size 18x108 starting at (192, 42).
; PLAN: r0=439(x1), r1=155(y1), r2=372(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=42(y), r7=18(width), r8=108(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 155
LDI r2, 372
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 42
LDI r7, 18
LDI r8, 108
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
