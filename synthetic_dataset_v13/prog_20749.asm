; DESCRIPTION: Draws a green line from (407, 48) to (47, 120).
; PLAN: r0=407(x1), r1=48(y1), r2=47(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 48
LDI r2, 47
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
