; DESCRIPTION: Renders a green line between points (33, 131) and (245, 6).
; PLAN: r0=33(x1), r1=131(y1), r2=245(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 131
LDI r2, 245
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
