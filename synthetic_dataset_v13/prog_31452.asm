; DESCRIPTION: Renders a purple line between points (294, 159) and (307, 179).
; PLAN: r0=294(x1), r1=159(y1), r2=307(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 159
LDI r2, 307
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
