; DESCRIPTION: Renders a white line between points (194, 111) and (148, 210).
; PLAN: r0=194(x1), r1=111(y1), r2=148(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 111
LDI r2, 148
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
