; DESCRIPTION: Renders a white line between points (200, 86) and (410, 199).
; PLAN: r0=200(x1), r1=86(y1), r2=410(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 86
LDI r2, 410
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
