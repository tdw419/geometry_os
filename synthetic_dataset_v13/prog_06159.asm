; DESCRIPTION: Composite: Renders a yellow line between points (241, 159) and (56, 74) then Renders a magenta box of size 99x110 starting at (71, 2).
; PLAN: r0=241(x1), r1=159(y1), r2=56(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=2(y), r7=99(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 159
LDI r2, 56
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 2
LDI r7, 99
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
