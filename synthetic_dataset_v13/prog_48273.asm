; DESCRIPTION: Renders a orange line between points (310, 225) and (479, 2).
; PLAN: r0=310(x1), r1=225(y1), r2=479(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 225
LDI r2, 479
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
