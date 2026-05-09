; DESCRIPTION: Composite: Renders a green box of size 91x88 starting at (292, 8) then Renders a black line between points (420, 204) and (246, 22).
; PLAN: r0=292(x), r1=8(y), r2=91(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x1), r6=204(y1), r7=246(x2), r8=22(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 8
LDI r2, 91
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 204
LDI r7, 246
LDI r8, 22
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
