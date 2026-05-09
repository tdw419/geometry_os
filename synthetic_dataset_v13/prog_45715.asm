; DESCRIPTION: Renders a green line between points (245, 182) and (29, 0).
; PLAN: r0=245(x1), r1=182(y1), r2=29(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 182
LDI r2, 29
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
