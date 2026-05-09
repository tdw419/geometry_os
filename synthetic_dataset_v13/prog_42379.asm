; DESCRIPTION: Places a red line segment connecting (303, 30) to (502, 191).
; PLAN: r0=303(x1), r1=30(y1), r2=502(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 30
LDI r2, 502
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
