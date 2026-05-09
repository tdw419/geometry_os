; DESCRIPTION: Places a yellow line segment connecting (302, 159) to (238, 146).
; PLAN: r0=302(x1), r1=159(y1), r2=238(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 159
LDI r2, 238
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
