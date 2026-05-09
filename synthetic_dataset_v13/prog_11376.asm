; DESCRIPTION: Renders a orange line between points (229, 197) and (44, 210).
; PLAN: r0=229(x1), r1=197(y1), r2=44(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 197
LDI r2, 44
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
