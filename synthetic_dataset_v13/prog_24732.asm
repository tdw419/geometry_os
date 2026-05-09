; DESCRIPTION: Places a cyan line segment connecting (491, 141) to (401, 12).
; PLAN: r0=491(x1), r1=141(y1), r2=401(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 141
LDI r2, 401
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
