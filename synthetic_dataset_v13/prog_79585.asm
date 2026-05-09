; DESCRIPTION: Draws a yellow line from (244, 95) to (422, 59).
; PLAN: r0=244(x1), r1=95(y1), r2=422(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 95
LDI r2, 422
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
