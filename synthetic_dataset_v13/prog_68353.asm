; DESCRIPTION: Renders a orange line between points (272, 213) and (355, 172).
; PLAN: r0=272(x1), r1=213(y1), r2=355(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 213
LDI r2, 355
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
