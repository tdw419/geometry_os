; DESCRIPTION: Renders a white line between points (307, 7) and (409, 75).
; PLAN: r0=307(x1), r1=7(y1), r2=409(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 7
LDI r2, 409
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
