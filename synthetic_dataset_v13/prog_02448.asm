; DESCRIPTION: Draws a red line from (94, 124) to (212, 19).
; PLAN: r0=94(x1), r1=124(y1), r2=212(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 124
LDI r2, 212
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
