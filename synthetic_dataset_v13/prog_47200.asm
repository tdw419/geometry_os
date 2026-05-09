; DESCRIPTION: Renders a white line between points (210, 164) and (11, 159).
; PLAN: r0=210(x1), r1=164(y1), r2=11(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 164
LDI r2, 11
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
