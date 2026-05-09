; DESCRIPTION: Draws a yellow line from (109, 168) to (73, 59).
; PLAN: r0=109(x1), r1=168(y1), r2=73(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 168
LDI r2, 73
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
