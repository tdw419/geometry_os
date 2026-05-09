; DESCRIPTION: Composite: Renders a yellow line between points (292, 233) and (153, 249) then Places a purple dot at position (20, 11) then Places a red 52x30 rectangle at position (34, 203).
; PLAN: r0=292(x1), r1=233(y1), r2=153(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=11(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=34(x), r11=203(y), r12=52(width), r13=30(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 233
LDI r2, 153
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 11
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 34
LDI r11, 203
LDI r12, 52
LDI r13, 30
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
