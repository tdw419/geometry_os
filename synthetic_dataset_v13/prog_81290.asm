; DESCRIPTION: Renders a green line between points (427, 187) and (271, 250).
; PLAN: r0=427(x1), r1=187(y1), r2=271(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 187
LDI r2, 271
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
