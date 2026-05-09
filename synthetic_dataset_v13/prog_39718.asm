; DESCRIPTION: Renders a green line between points (46, 150) and (302, 33).
; PLAN: r0=46(x1), r1=150(y1), r2=302(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 150
LDI r2, 302
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
