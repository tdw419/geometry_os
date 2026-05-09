; DESCRIPTION: Renders a orange line between points (392, 171) and (393, 158).
; PLAN: r0=392(x1), r1=171(y1), r2=393(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 171
LDI r2, 393
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
