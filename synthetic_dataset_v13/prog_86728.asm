; DESCRIPTION: Draws a green line from (237, 200) to (9, 32).
; PLAN: r0=237(x1), r1=200(y1), r2=9(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 200
LDI r2, 9
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
