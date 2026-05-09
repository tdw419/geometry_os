; DESCRIPTION: Renders a yellow line between points (391, 177) and (66, 195).
; PLAN: r0=391(x1), r1=177(y1), r2=66(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 177
LDI r2, 66
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
