; DESCRIPTION: Draws a green line from (370, 229) to (251, 196).
; PLAN: r0=370(x1), r1=229(y1), r2=251(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 229
LDI r2, 251
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
