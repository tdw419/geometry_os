; DESCRIPTION: Renders a orange line between points (174, 213) and (217, 234).
; PLAN: r0=174(x1), r1=213(y1), r2=217(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 213
LDI r2, 217
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
