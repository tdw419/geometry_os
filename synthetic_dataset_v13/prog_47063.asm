; DESCRIPTION: Draws a yellow line from (254, 255) to (115, 229).
; PLAN: r0=254(x1), r1=255(y1), r2=115(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 255
LDI r2, 115
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
