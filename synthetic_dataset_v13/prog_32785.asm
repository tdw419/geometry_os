; DESCRIPTION: Draws a red line from (125, 180) to (272, 2).
; PLAN: r0=125(x1), r1=180(y1), r2=272(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 180
LDI r2, 272
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
