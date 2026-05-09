; DESCRIPTION: Draws a orange line from (12, 27) to (439, 225).
; PLAN: r0=12(x1), r1=27(y1), r2=439(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 27
LDI r2, 439
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
