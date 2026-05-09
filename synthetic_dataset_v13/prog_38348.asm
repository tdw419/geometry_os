; DESCRIPTION: Places a black line segment connecting (462, 114) to (370, 146).
; PLAN: r0=462(x1), r1=114(y1), r2=370(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 114
LDI r2, 370
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
