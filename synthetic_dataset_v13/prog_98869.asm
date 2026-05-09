; DESCRIPTION: Draws a green line from (392, 183) to (426, 181).
; PLAN: r0=392(x1), r1=183(y1), r2=426(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 183
LDI r2, 426
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
