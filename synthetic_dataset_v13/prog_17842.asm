; DESCRIPTION: Composite: Renders a cyan line between points (296, 18) and (262, 48) then Draws a orange circle centered at (56, 116) with radius 26.
; PLAN: r0=296(x1), r1=18(y1), r2=262(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=116(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 18
LDI r2, 262
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 116
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
