; DESCRIPTION: Renders a cyan line between points (451, 203) and (130, 177).
; PLAN: r0=451(x1), r1=203(y1), r2=130(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 203
LDI r2, 130
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
