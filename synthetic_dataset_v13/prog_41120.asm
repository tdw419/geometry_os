; DESCRIPTION: Renders a cyan line between points (44, 236) and (349, 163).
; PLAN: r0=44(x1), r1=236(y1), r2=349(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 236
LDI r2, 349
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
