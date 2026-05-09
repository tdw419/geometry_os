; DESCRIPTION: Places a yellow line segment connecting (7, 205) to (413, 241).
; PLAN: r0=7(x1), r1=205(y1), r2=413(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 205
LDI r2, 413
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
