; DESCRIPTION: Draws a blue line from (218, 58) to (16, 56).
; PLAN: r0=218(x1), r1=58(y1), r2=16(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 58
LDI r2, 16
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
