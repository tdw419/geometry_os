; DESCRIPTION: Renders a green line between points (265, 154) and (454, 92).
; PLAN: r0=265(x1), r1=154(y1), r2=454(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 154
LDI r2, 454
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
