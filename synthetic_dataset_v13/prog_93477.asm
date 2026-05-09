; DESCRIPTION: Places a yellow line segment connecting (405, 85) to (182, 73).
; PLAN: r0=405(x1), r1=85(y1), r2=182(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 85
LDI r2, 182
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
