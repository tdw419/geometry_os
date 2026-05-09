; DESCRIPTION: Draws a green line from (229, 235) to (160, 40).
; PLAN: r0=229(x1), r1=235(y1), r2=160(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 235
LDI r2, 160
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
