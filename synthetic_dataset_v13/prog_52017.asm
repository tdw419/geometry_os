; DESCRIPTION: Places a purple line segment connecting (405, 223) to (173, 63).
; PLAN: r0=405(x1), r1=223(y1), r2=173(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 223
LDI r2, 173
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
