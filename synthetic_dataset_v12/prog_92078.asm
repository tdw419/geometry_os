; DESCRIPTION: Places a purple line segment connecting (466, 111) to (114, 228).
; PLAN: r0=466(x1), r1=111(y1), r2=114(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 111
LDI r2, 114
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
