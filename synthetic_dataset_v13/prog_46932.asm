; DESCRIPTION: Draws a yellow line from (149, 124) to (232, 42).
; PLAN: r0=149(x1), r1=124(y1), r2=232(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 124
LDI r2, 232
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
