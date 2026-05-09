; DESCRIPTION: Renders a cyan line between points (104, 80) and (422, 233).
; PLAN: r0=104(x1), r1=80(y1), r2=422(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 80
LDI r2, 422
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
