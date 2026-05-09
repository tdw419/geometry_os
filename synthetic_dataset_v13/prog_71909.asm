; DESCRIPTION: Composite: Draws a white rectangle at (405, 71) with width 10 and height 15 then Renders a purple line between points (425, 25) and (101, 24).
; PLAN: r0=405(x), r1=71(y), r2=10(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x1), r6=25(y1), r7=101(x2), r8=24(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 71
LDI r2, 10
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 25
LDI r7, 101
LDI r8, 24
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
