; DESCRIPTION: Places a blue line segment connecting (354, 221) to (437, 156).
; PLAN: r0=354(x1), r1=221(y1), r2=437(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 221
LDI r2, 437
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
