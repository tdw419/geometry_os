; DESCRIPTION: Renders a cyan line between points (471, 108) and (206, 77).
; PLAN: r0=471(x1), r1=108(y1), r2=206(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 108
LDI r2, 206
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
