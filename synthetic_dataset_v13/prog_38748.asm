; DESCRIPTION: Places a cyan line segment connecting (422, 33) to (65, 11).
; PLAN: r0=422(x1), r1=33(y1), r2=65(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 33
LDI r2, 65
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
