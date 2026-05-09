; DESCRIPTION: Draws a yellow line from (411, 68) to (87, 59).
; PLAN: r0=411(x1), r1=68(y1), r2=87(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 68
LDI r2, 87
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
