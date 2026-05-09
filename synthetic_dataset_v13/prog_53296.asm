; DESCRIPTION: Renders a green line between points (245, 102) and (428, 177).
; PLAN: r0=245(x1), r1=102(y1), r2=428(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 102
LDI r2, 428
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
