; DESCRIPTION: Composite: Renders a cyan line between points (430, 39) and (252, 88) then Draws a yellow rectangle at (275, 73) with width 56 and height 41.
; PLAN: r0=430(x1), r1=39(y1), r2=252(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=73(y), r7=56(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 39
LDI r2, 252
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 73
LDI r7, 56
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
