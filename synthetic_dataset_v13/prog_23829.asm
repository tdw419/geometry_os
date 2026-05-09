; DESCRIPTION: Renders a cyan line between points (204, 154) and (163, 91).
; PLAN: r0=204(x1), r1=154(y1), r2=163(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 154
LDI r2, 163
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
