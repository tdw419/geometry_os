; DESCRIPTION: Renders a cyan line between points (503, 92) and (395, 184).
; PLAN: r0=503(x1), r1=92(y1), r2=395(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 92
LDI r2, 395
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
