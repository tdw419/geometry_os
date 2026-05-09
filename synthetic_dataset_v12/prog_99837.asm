; DESCRIPTION: Renders a cyan line between points (422, 234) and (411, 117).
; PLAN: r0=422(x1), r1=234(y1), r2=411(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 234
LDI r2, 411
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
