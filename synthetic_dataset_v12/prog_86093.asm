; DESCRIPTION: Places a green line segment connecting (52, 69) to (303, 182).
; PLAN: r0=52(x1), r1=69(y1), r2=303(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 69
LDI r2, 303
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
