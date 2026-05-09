; DESCRIPTION: Places a green line segment connecting (245, 250) to (478, 174).
; PLAN: r0=245(x1), r1=250(y1), r2=478(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 250
LDI r2, 478
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
