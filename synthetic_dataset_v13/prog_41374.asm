; DESCRIPTION: Composite: Sets a single cyan pixel at (113, 96) then Places a orange circle of radius 30 at center (444, 41) then Renders a green line between points (297, 119) and (424, 10).
; PLAN: r0=113(x), r1=96(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=444(x), r6=41(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=297(x1), r11=119(y1), r12=424(x2), r13=10(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 96
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 444
LDI r6, 41
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 297
LDI r11, 119
LDI r12, 424
LDI r13, 10
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
