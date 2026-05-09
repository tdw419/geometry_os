; DESCRIPTION: Renders a cyan line between points (118, 26) and (246, 204).
; PLAN: r0=118(x1), r1=26(y1), r2=246(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 26
LDI r2, 246
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
