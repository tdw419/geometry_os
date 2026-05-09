; DESCRIPTION: Places a black line segment connecting (365, 176) to (329, 8).
; PLAN: r0=365(x1), r1=176(y1), r2=329(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 176
LDI r2, 329
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
