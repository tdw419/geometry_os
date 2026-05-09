; DESCRIPTION: Renders a green line between points (391, 195) and (457, 213).
; PLAN: r0=391(x1), r1=195(y1), r2=457(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 195
LDI r2, 457
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
