; DESCRIPTION: Renders a cyan line between points (349, 212) and (301, 227).
; PLAN: r0=349(x1), r1=212(y1), r2=301(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 212
LDI r2, 301
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
