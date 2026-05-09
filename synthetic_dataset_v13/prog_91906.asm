; DESCRIPTION: Places a purple line segment connecting (499, 133) to (113, 103).
; PLAN: r0=499(x1), r1=133(y1), r2=113(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 133
LDI r2, 113
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
