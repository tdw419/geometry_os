; DESCRIPTION: Renders a orange line between points (102, 133) and (479, 48).
; PLAN: r0=102(x1), r1=133(y1), r2=479(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 133
LDI r2, 479
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
