; DESCRIPTION: Places a cyan line segment connecting (134, 86) to (401, 225).
; PLAN: r0=134(x1), r1=86(y1), r2=401(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 86
LDI r2, 401
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
