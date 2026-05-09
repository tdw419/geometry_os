; DESCRIPTION: Draws a purple line from (27, 124) to (425, 156).
; PLAN: r0=27(x1), r1=124(y1), r2=425(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 124
LDI r2, 425
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
