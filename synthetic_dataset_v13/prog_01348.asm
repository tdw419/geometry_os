; DESCRIPTION: Composite: Draws a green circle centered at (298, 199) with radius 24 then Renders a orange line between points (317, 193) and (83, 137) then Renders a cyan box of size 47x26 starting at (413, 41).
; PLAN: r0=298(x), r1=199(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x1), r6=193(y1), r7=83(x2), r8=137(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=413(x), r11=41(y), r12=47(width), r13=26(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 199
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 193
LDI r7, 83
LDI r8, 137
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 41
LDI r12, 47
LDI r13, 26
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
