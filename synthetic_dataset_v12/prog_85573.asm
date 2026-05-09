; DESCRIPTION: Renders a green line between points (111, 109) and (316, 204).
; PLAN: r0=111(x1), r1=109(y1), r2=316(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 109
LDI r2, 316
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
