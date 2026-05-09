; DESCRIPTION: Places a green line segment connecting (177, 241) to (72, 243).
; PLAN: r0=177(x1), r1=241(y1), r2=72(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 241
LDI r2, 72
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
