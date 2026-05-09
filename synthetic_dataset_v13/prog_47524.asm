; DESCRIPTION: Renders a cyan line between points (503, 57) and (296, 0).
; PLAN: r0=503(x1), r1=57(y1), r2=296(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 57
LDI r2, 296
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
