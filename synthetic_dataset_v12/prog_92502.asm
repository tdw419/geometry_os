; DESCRIPTION: Renders a orange line between points (479, 145) and (249, 48).
; PLAN: r0=479(x1), r1=145(y1), r2=249(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 145
LDI r2, 249
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
