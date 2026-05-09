; DESCRIPTION: Renders a orange line between points (420, 57) and (479, 170).
; PLAN: r0=420(x1), r1=57(y1), r2=479(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 57
LDI r2, 479
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
