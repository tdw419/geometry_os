; DESCRIPTION: Draws a yellow line from (387, 205) to (389, 180).
; PLAN: r0=387(x1), r1=205(y1), r2=389(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 205
LDI r2, 389
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
