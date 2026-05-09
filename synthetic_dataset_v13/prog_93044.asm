; DESCRIPTION: Draws a cyan line from (422, 241) to (170, 162).
; PLAN: r0=422(x1), r1=241(y1), r2=170(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 241
LDI r2, 170
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
