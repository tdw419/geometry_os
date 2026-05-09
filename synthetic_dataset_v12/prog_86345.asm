; DESCRIPTION: Places a green line segment connecting (221, 48) to (142, 243).
; PLAN: r0=221(x1), r1=48(y1), r2=142(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 48
LDI r2, 142
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
