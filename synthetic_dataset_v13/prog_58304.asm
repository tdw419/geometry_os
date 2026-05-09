; DESCRIPTION: Renders a yellow line between points (468, 117) and (362, 213).
; PLAN: r0=468(x1), r1=117(y1), r2=362(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 117
LDI r2, 362
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
