; DESCRIPTION: Draws a white line from (453, 109) to (326, 20).
; PLAN: r0=453(x1), r1=109(y1), r2=326(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 109
LDI r2, 326
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
