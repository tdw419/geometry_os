; DESCRIPTION: Composite: Renders a green disk with center (89, 143) and radius 65 then Draws a green line from (115, 233) to (177, 6) then Draws a green rectangle at (77, 173) with width 41 and height 34.
; PLAN: r0=89(x), r1=143(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x1), r6=233(y1), r7=177(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=173(y), r12=41(width), r13=34(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 143
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 233
LDI r7, 177
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 173
LDI r12, 41
LDI r13, 34
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
