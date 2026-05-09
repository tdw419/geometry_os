; DESCRIPTION: Draws a green line from (59, 63) to (163, 207).
; PLAN: r0=59(x1), r1=63(y1), r2=163(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 63
LDI r2, 163
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
