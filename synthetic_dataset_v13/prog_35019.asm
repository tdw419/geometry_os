; DESCRIPTION: Places a yellow line segment connecting (349, 143) to (372, 225).
; PLAN: r0=349(x1), r1=143(y1), r2=372(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 143
LDI r2, 372
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
