; DESCRIPTION: Renders a cyan line between points (212, 204) and (245, 44).
; PLAN: r0=212(x1), r1=204(y1), r2=245(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 204
LDI r2, 245
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
