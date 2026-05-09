; DESCRIPTION: Draws a green line from (65, 23) to (475, 198).
; PLAN: r0=65(x1), r1=23(y1), r2=475(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 23
LDI r2, 475
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
