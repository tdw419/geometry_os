; DESCRIPTION: Renders a orange line between points (405, 201) and (398, 236).
; PLAN: r0=405(x1), r1=201(y1), r2=398(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 201
LDI r2, 398
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
