; DESCRIPTION: Renders a cyan line between points (73, 234) and (466, 180).
; PLAN: r0=73(x1), r1=234(y1), r2=466(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 234
LDI r2, 466
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
