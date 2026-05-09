; DESCRIPTION: Places a purple line segment connecting (44, 186) to (157, 228).
; PLAN: r0=44(x1), r1=186(y1), r2=157(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 186
LDI r2, 157
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
