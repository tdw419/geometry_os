; DESCRIPTION: Renders a white line between points (424, 46) and (159, 16).
; PLAN: r0=424(x1), r1=46(y1), r2=159(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 46
LDI r2, 159
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
