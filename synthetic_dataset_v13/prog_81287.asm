; DESCRIPTION: Draws a green line from (325, 26) to (64, 40).
; PLAN: r0=325(x1), r1=26(y1), r2=64(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 26
LDI r2, 64
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
