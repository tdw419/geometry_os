; DESCRIPTION: Composite: Renders a orange line between points (242, 27) and (347, 76) then Draws a yellow rectangle at (357, 62) with width 41 and height 86.
; PLAN: r0=242(x1), r1=27(y1), r2=347(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=357(x), r6=62(y), r7=41(width), r8=86(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 27
LDI r2, 347
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 62
LDI r7, 41
LDI r8, 86
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
