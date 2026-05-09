; DESCRIPTION: Composite: Draws a magenta line from (334, 208) to (400, 112) then Draws a yellow rectangle at (21, 110) with width 93 and height 80.
; PLAN: r0=334(x1), r1=208(y1), r2=400(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=21(x), r6=110(y), r7=93(width), r8=80(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 208
LDI r2, 400
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 110
LDI r7, 93
LDI r8, 80
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
