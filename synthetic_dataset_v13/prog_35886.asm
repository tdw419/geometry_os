; DESCRIPTION: Renders a cyan line between points (472, 197) and (503, 9).
; PLAN: r0=472(x1), r1=197(y1), r2=503(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 197
LDI r2, 503
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
