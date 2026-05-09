; DESCRIPTION: Draws a red line from (321, 111) to (500, 86).
; PLAN: r0=321(x1), r1=111(y1), r2=500(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 111
LDI r2, 500
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
