; DESCRIPTION: Places a white line segment connecting (485, 129) to (422, 168).
; PLAN: r0=485(x1), r1=129(y1), r2=422(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 129
LDI r2, 422
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
