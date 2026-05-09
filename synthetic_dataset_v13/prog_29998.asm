; DESCRIPTION: Renders a orange line between points (479, 143) and (439, 22).
; PLAN: r0=479(x1), r1=143(y1), r2=439(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 143
LDI r2, 439
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
