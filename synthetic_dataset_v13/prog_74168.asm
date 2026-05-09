; DESCRIPTION: Places a purple line segment connecting (509, 82) to (346, 158).
; PLAN: r0=509(x1), r1=82(y1), r2=346(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 82
LDI r2, 346
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
