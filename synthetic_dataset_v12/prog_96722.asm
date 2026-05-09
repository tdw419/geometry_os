; DESCRIPTION: Renders a white line between points (421, 125) and (153, 193).
; PLAN: r0=421(x1), r1=125(y1), r2=153(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 125
LDI r2, 153
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
