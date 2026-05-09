; DESCRIPTION: Renders a cyan line between points (338, 122) and (245, 17).
; PLAN: r0=338(x1), r1=122(y1), r2=245(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 122
LDI r2, 245
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
