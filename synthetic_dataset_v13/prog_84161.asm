; DESCRIPTION: Renders a orange line between points (121, 186) and (272, 226).
; PLAN: r0=121(x1), r1=186(y1), r2=272(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 186
LDI r2, 272
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
