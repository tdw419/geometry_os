; DESCRIPTION: Draws a blue line from (380, 181) to (182, 117).
; PLAN: r0=380(x1), r1=181(y1), r2=182(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 181
LDI r2, 182
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
