; DESCRIPTION: Draws a blue line from (196, 124) to (367, 254).
; PLAN: r0=196(x1), r1=124(y1), r2=367(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 124
LDI r2, 367
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
