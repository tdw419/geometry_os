; DESCRIPTION: Draws a yellow line from (223, 12) to (32, 244).
; PLAN: r0=223(x1), r1=12(y1), r2=32(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 12
LDI r2, 32
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
