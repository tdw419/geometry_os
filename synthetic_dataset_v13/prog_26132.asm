; DESCRIPTION: Places a green line segment connecting (406, 254) to (408, 121).
; PLAN: r0=406(x1), r1=254(y1), r2=408(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 254
LDI r2, 408
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
