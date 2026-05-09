; DESCRIPTION: Composite: Renders a purple line between points (480, 226) and (140, 181) then Renders a purple box of size 17x70 starting at (381, 118).
; PLAN: r0=480(x1), r1=226(y1), r2=140(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=118(y), r7=17(width), r8=70(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 226
LDI r2, 140
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 118
LDI r7, 17
LDI r8, 70
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
