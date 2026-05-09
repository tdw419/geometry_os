; DESCRIPTION: Renders a green line between points (85, 182) and (170, 103).
; PLAN: r0=85(x1), r1=182(y1), r2=170(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 182
LDI r2, 170
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
