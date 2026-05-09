; DESCRIPTION: Places a white line segment connecting (152, 60) to (401, 172).
; PLAN: r0=152(x1), r1=60(y1), r2=401(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 60
LDI r2, 401
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
