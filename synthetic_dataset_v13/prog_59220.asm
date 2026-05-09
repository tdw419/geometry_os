; DESCRIPTION: Renders a orange line between points (300, 64) and (479, 71).
; PLAN: r0=300(x1), r1=64(y1), r2=479(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 64
LDI r2, 479
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
