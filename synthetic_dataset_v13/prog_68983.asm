; DESCRIPTION: Composite: Renders a red line between points (366, 30) and (77, 17) then Draws a orange rectangle at (348, 130) with width 50 and height 64 then Places a yellow dot at position (187, 55).
; PLAN: r0=366(x1), r1=30(y1), r2=77(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=130(y), r7=50(width), r8=64(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=187(x), r11=55(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 366
LDI r1, 30
LDI r2, 77
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 130
LDI r7, 50
LDI r8, 64
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 55
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
