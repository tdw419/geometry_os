; DESCRIPTION: Draws a blue line from (234, 244) to (48, 68).
; PLAN: r0=234(x1), r1=244(y1), r2=48(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 244
LDI r2, 48
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
