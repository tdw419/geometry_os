; DESCRIPTION: Places a cyan line segment connecting (372, 20) to (422, 47).
; PLAN: r0=372(x1), r1=20(y1), r2=422(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 20
LDI r2, 422
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
