; DESCRIPTION: Renders a green line between points (228, 4) and (498, 53).
; PLAN: r0=228(x1), r1=4(y1), r2=498(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 4
LDI r2, 498
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
