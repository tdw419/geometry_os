; DESCRIPTION: Renders a red line between points (159, 98) and (433, 164).
; PLAN: r0=159(x1), r1=98(y1), r2=433(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 98
LDI r2, 433
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
