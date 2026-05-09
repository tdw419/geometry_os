; DESCRIPTION: Draws a orange line from (446, 112) to (361, 221).
; PLAN: r0=446(x1), r1=112(y1), r2=361(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 112
LDI r2, 361
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
