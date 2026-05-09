; DESCRIPTION: Draws a blue line from (365, 244) to (38, 196).
; PLAN: r0=365(x1), r1=244(y1), r2=38(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 244
LDI r2, 38
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
