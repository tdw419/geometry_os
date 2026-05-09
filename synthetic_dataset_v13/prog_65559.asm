; DESCRIPTION: Renders a cyan line between points (200, 229) and (38, 239).
; PLAN: r0=200(x1), r1=229(y1), r2=38(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 229
LDI r2, 38
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
