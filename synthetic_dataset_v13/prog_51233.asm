; DESCRIPTION: Places a purple line segment connecting (511, 42) to (405, 193).
; PLAN: r0=511(x1), r1=42(y1), r2=405(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 42
LDI r2, 405
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
