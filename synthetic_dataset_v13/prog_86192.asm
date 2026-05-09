; DESCRIPTION: Draws a yellow line from (331, 196) to (36, 231).
; PLAN: r0=331(x1), r1=196(y1), r2=36(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 196
LDI r2, 36
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
