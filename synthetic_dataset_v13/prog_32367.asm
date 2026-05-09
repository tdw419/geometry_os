; DESCRIPTION: Places a green line segment connecting (303, 125) to (470, 91).
; PLAN: r0=303(x1), r1=125(y1), r2=470(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 125
LDI r2, 470
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
