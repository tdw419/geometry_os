; DESCRIPTION: Composite: Renders a orange box of size 109x119 starting at (270, 4) then Renders a red line between points (382, 4) and (354, 62).
; PLAN: r0=270(x), r1=4(y), r2=109(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x1), r6=4(y1), r7=354(x2), r8=62(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 4
LDI r2, 109
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 4
LDI r7, 354
LDI r8, 62
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
