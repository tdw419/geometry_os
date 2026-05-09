; DESCRIPTION: Draws a blue line from (245, 128) to (334, 115).
; PLAN: r0=245(x1), r1=128(y1), r2=334(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 128
LDI r2, 334
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
