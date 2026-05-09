; DESCRIPTION: Renders a cyan line between points (218, 219) and (169, 38).
; PLAN: r0=218(x1), r1=219(y1), r2=169(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 219
LDI r2, 169
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
