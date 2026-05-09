; DESCRIPTION: Composite: Renders a yellow line between points (173, 149) and (86, 173) then Renders a purple box of size 20x99 starting at (261, 78).
; PLAN: r0=173(x1), r1=149(y1), r2=86(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=78(y), r7=20(width), r8=99(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 149
LDI r2, 86
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 78
LDI r7, 20
LDI r8, 99
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
