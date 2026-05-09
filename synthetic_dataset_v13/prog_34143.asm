; DESCRIPTION: Draws a green line from (54, 150) to (469, 229).
; PLAN: r0=54(x1), r1=150(y1), r2=469(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 150
LDI r2, 469
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
