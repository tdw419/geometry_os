; DESCRIPTION: Renders a cyan line between points (401, 229) and (254, 90).
; PLAN: r0=401(x1), r1=229(y1), r2=254(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 229
LDI r2, 254
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
