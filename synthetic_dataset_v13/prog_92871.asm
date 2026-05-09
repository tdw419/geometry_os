; DESCRIPTION: Renders a red line between points (293, 148) and (479, 52).
; PLAN: r0=293(x1), r1=148(y1), r2=479(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 148
LDI r2, 479
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
