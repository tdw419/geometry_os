; DESCRIPTION: Places a green line segment connecting (127, 202) to (303, 3).
; PLAN: r0=127(x1), r1=202(y1), r2=303(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 202
LDI r2, 303
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
