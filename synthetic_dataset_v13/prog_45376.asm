; DESCRIPTION: Renders a cyan line between points (97, 169) and (122, 28).
; PLAN: r0=97(x1), r1=169(y1), r2=122(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 169
LDI r2, 122
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
