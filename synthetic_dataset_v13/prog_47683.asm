; DESCRIPTION: Places a red line segment connecting (264, 112) to (409, 50).
; PLAN: r0=264(x1), r1=112(y1), r2=409(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 112
LDI r2, 409
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
