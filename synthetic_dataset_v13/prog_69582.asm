; DESCRIPTION: Renders a green line between points (401, 231) and (407, 157).
; PLAN: r0=401(x1), r1=231(y1), r2=407(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 231
LDI r2, 407
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
