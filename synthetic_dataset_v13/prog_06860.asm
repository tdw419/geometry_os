; DESCRIPTION: Renders a green line between points (150, 91) and (353, 33).
; PLAN: r0=150(x1), r1=91(y1), r2=353(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 91
LDI r2, 353
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
