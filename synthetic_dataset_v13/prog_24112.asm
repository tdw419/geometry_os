; DESCRIPTION: Draws a green line from (223, 198) to (32, 103).
; PLAN: r0=223(x1), r1=198(y1), r2=32(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 198
LDI r2, 32
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
