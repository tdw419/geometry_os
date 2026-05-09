; DESCRIPTION: Places a blue line segment connecting (394, 197) to (91, 241).
; PLAN: r0=394(x1), r1=197(y1), r2=91(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 197
LDI r2, 91
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
