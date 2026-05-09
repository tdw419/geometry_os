; DESCRIPTION: Places a cyan line segment connecting (134, 204) to (422, 125).
; PLAN: r0=134(x1), r1=204(y1), r2=422(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 204
LDI r2, 422
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
