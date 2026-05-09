; DESCRIPTION: Draws a green line from (243, 142) to (369, 128).
; PLAN: r0=243(x1), r1=142(y1), r2=369(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 142
LDI r2, 369
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
