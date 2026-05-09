; DESCRIPTION: Renders a yellow line between points (316, 168) and (430, 213).
; PLAN: r0=316(x1), r1=168(y1), r2=430(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 168
LDI r2, 430
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
