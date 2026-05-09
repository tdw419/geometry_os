; DESCRIPTION: Composite: Renders a white box of size 109x94 starting at (50, 89) then Renders a purple line between points (423, 48) and (177, 113).
; PLAN: r0=50(x), r1=89(y), r2=109(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x1), r6=48(y1), r7=177(x2), r8=113(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 89
LDI r2, 109
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 48
LDI r7, 177
LDI r8, 113
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
