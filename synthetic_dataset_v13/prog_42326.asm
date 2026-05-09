; DESCRIPTION: Renders a cyan line between points (159, 143) and (357, 196).
; PLAN: r0=159(x1), r1=143(y1), r2=357(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 143
LDI r2, 357
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
