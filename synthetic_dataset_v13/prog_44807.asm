; DESCRIPTION: Places a cyan line segment connecting (422, 162) to (486, 224).
; PLAN: r0=422(x1), r1=162(y1), r2=486(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 162
LDI r2, 486
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
