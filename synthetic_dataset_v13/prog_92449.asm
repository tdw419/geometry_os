; DESCRIPTION: Draws a green line from (326, 144) to (188, 220).
; PLAN: r0=326(x1), r1=144(y1), r2=188(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 144
LDI r2, 188
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
