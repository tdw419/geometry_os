; DESCRIPTION: Places a red line segment connecting (487, 136) to (247, 225).
; PLAN: r0=487(x1), r1=136(y1), r2=247(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 136
LDI r2, 247
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
