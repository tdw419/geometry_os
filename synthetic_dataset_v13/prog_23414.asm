; DESCRIPTION: Draws a green line from (36, 44) to (61, 142).
; PLAN: r0=36(x1), r1=44(y1), r2=61(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 44
LDI r2, 61
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
