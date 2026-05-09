; DESCRIPTION: Renders a white line between points (134, 174) and (479, 211).
; PLAN: r0=134(x1), r1=174(y1), r2=479(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 174
LDI r2, 479
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
