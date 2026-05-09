; DESCRIPTION: Composite: Renders a yellow box of size 48x34 starting at (460, 203) then Renders a orange line between points (6, 175) and (44, 47).
; PLAN: r0=460(x), r1=203(y), r2=48(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=6(x1), r6=175(y1), r7=44(x2), r8=47(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 460
LDI r1, 203
LDI r2, 48
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 175
LDI r7, 44
LDI r8, 47
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
