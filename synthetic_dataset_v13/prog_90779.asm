; DESCRIPTION: Places a yellow line segment connecting (278, 197) to (199, 187).
; PLAN: r0=278(x1), r1=197(y1), r2=199(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 197
LDI r2, 199
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
