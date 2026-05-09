; DESCRIPTION: Renders a cyan line between points (466, 40) and (86, 199).
; PLAN: r0=466(x1), r1=40(y1), r2=86(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 40
LDI r2, 86
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
