; DESCRIPTION: Renders a white line between points (422, 67) and (98, 84).
; PLAN: r0=422(x1), r1=67(y1), r2=98(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 67
LDI r2, 98
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
