; DESCRIPTION: Places a green line segment connecting (303, 55) to (177, 196).
; PLAN: r0=303(x1), r1=55(y1), r2=177(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 55
LDI r2, 177
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
