; DESCRIPTION: Renders a cyan line between points (422, 118) and (305, 114).
; PLAN: r0=422(x1), r1=118(y1), r2=305(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 118
LDI r2, 305
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
