; DESCRIPTION: Places a yellow line segment connecting (228, 145) to (303, 91).
; PLAN: r0=228(x1), r1=145(y1), r2=303(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 145
LDI r2, 303
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
