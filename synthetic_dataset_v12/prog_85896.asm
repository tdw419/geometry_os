; DESCRIPTION: Places a cyan line segment connecting (253, 161) to (401, 70).
; PLAN: r0=253(x1), r1=161(y1), r2=401(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 161
LDI r2, 401
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
