; DESCRIPTION: Composite: Renders a orange disk with center (268, 87) and radius 48 then Renders a cyan box of size 110x52 starting at (278, 159) then Renders a red line between points (286, 33) and (147, 228).
; PLAN: r0=268(x), r1=87(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=159(y), r7=110(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=286(x1), r11=33(y1), r12=147(x2), r13=228(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 87
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 159
LDI r7, 110
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 33
LDI r12, 147
LDI r13, 228
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
