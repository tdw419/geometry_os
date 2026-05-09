; DESCRIPTION: Places a green line segment connecting (260, 18) to (346, 251).
; PLAN: r0=260(x1), r1=18(y1), r2=346(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 18
LDI r2, 346
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
