; DESCRIPTION: Renders a cyan line between points (426, 189) and (245, 203).
; PLAN: r0=426(x1), r1=189(y1), r2=245(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 189
LDI r2, 245
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
