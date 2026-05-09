; DESCRIPTION: Renders a orange line between points (202, 243) and (329, 149).
; PLAN: r0=202(x1), r1=243(y1), r2=329(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 243
LDI r2, 329
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
