; DESCRIPTION: Renders a cyan line between points (177, 6) and (90, 58).
; PLAN: r0=177(x1), r1=6(y1), r2=90(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 6
LDI r2, 90
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
