; DESCRIPTION: Places a purple line segment connecting (171, 113) to (228, 160).
; PLAN: r0=171(x1), r1=113(y1), r2=228(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 113
LDI r2, 228
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
