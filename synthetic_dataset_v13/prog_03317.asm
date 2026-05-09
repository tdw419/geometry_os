; DESCRIPTION: Renders a orange line between points (66, 27) and (455, 138).
; PLAN: r0=66(x1), r1=27(y1), r2=455(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 27
LDI r2, 455
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
