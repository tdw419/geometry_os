; DESCRIPTION: Composite: Renders a red box of size 25x59 starting at (136, 144) then Renders a purple line between points (130, 33) and (170, 115).
; PLAN: r0=136(x), r1=144(y), r2=25(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=33(y1), r7=170(x2), r8=115(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 144
LDI r2, 25
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 33
LDI r7, 170
LDI r8, 115
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
