; DESCRIPTION: Renders a black line between points (465, 171) and (145, 68).
; PLAN: r0=465(x1), r1=171(y1), r2=145(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 171
LDI r2, 145
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
