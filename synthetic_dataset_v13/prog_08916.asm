; DESCRIPTION: Places a purple line segment connecting (341, 196) to (220, 228).
; PLAN: r0=341(x1), r1=196(y1), r2=220(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 196
LDI r2, 220
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
