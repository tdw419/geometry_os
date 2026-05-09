; DESCRIPTION: Draws a green line from (371, 252) to (243, 170).
; PLAN: r0=371(x1), r1=252(y1), r2=243(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 252
LDI r2, 243
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
