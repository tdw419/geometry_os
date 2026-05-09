; DESCRIPTION: Places a magenta line segment connecting (176, 141) to (422, 125).
; PLAN: r0=176(x1), r1=141(y1), r2=422(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 141
LDI r2, 422
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
