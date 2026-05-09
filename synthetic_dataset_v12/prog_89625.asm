; DESCRIPTION: Draws a green line from (176, 200) to (215, 54).
; PLAN: r0=176(x1), r1=200(y1), r2=215(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 200
LDI r2, 215
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
