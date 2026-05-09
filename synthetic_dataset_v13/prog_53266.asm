; DESCRIPTION: Renders a orange line between points (100, 138) and (479, 135).
; PLAN: r0=100(x1), r1=138(y1), r2=479(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 138
LDI r2, 479
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
