; DESCRIPTION: Renders a cyan line between points (36, 195) and (451, 199).
; PLAN: r0=36(x1), r1=195(y1), r2=451(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 195
LDI r2, 451
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
