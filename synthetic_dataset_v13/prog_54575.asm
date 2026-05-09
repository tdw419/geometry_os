; DESCRIPTION: Renders a cyan line between points (339, 59) and (422, 159).
; PLAN: r0=339(x1), r1=59(y1), r2=422(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 59
LDI r2, 422
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
