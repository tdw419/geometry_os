; DESCRIPTION: Places a yellow line segment connecting (197, 11) to (372, 98).
; PLAN: r0=197(x1), r1=11(y1), r2=372(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 11
LDI r2, 372
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
