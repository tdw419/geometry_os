; DESCRIPTION: Renders a cyan line between points (503, 206) and (417, 100).
; PLAN: r0=503(x1), r1=206(y1), r2=417(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 206
LDI r2, 417
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
