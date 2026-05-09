; DESCRIPTION: Draws a green line from (27, 229) to (56, 171).
; PLAN: r0=27(x1), r1=229(y1), r2=56(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 229
LDI r2, 56
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
