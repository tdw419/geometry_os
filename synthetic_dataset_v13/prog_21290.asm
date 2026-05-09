; DESCRIPTION: Places a white line segment connecting (290, 37) to (322, 50).
; PLAN: r0=290(x1), r1=37(y1), r2=322(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 37
LDI r2, 322
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
