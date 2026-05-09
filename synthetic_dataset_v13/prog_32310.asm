; DESCRIPTION: Places a yellow line segment connecting (120, 117) to (91, 108).
; PLAN: r0=120(x1), r1=117(y1), r2=91(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 117
LDI r2, 91
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
