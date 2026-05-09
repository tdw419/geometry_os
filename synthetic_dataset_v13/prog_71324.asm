; DESCRIPTION: Draws a green line from (390, 59) to (20, 234).
; PLAN: r0=390(x1), r1=59(y1), r2=20(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 59
LDI r2, 20
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
