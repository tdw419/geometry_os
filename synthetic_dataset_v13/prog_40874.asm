; DESCRIPTION: Places a green line segment connecting (381, 171) to (81, 21).
; PLAN: r0=381(x1), r1=171(y1), r2=81(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 171
LDI r2, 81
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
