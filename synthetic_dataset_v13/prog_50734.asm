; DESCRIPTION: Composite: Renders a orange line between points (156, 47) and (269, 119) then Renders a blue box of size 36x41 starting at (9, 129).
; PLAN: r0=156(x1), r1=47(y1), r2=269(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=129(y), r7=36(width), r8=41(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 47
LDI r2, 269
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 129
LDI r7, 36
LDI r8, 41
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
