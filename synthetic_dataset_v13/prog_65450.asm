; DESCRIPTION: Draws a yellow line from (340, 231) to (210, 227).
; PLAN: r0=340(x1), r1=231(y1), r2=210(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 231
LDI r2, 210
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
