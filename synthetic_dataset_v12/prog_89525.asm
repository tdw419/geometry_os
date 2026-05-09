; DESCRIPTION: Places a green line segment connecting (32, 174) to (206, 200).
; PLAN: r0=32(x1), r1=174(y1), r2=206(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 174
LDI r2, 206
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
