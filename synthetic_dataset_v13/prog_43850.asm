; DESCRIPTION: Composite: Draws a white rectangle at (288, 40) with width 10 and height 117 then Sets a single yellow pixel at (461, 78) then Renders a cyan line between points (157, 159) and (281, 124).
; PLAN: r0=288(x), r1=40(y), r2=10(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=78(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=157(x1), r11=159(y1), r12=281(x2), r13=124(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 40
LDI r2, 10
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 78
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 157
LDI r11, 159
LDI r12, 281
LDI r13, 124
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
