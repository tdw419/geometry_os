; DESCRIPTION: Draws a cyan line from (422, 73) to (508, 54).
; PLAN: r0=422(x1), r1=73(y1), r2=508(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 73
LDI r2, 508
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
