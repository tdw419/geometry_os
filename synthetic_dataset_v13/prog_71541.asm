; DESCRIPTION: Places a purple line segment connecting (228, 136) to (186, 173).
; PLAN: r0=228(x1), r1=136(y1), r2=186(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 136
LDI r2, 186
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
