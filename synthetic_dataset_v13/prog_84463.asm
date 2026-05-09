; DESCRIPTION: Renders a purple line between points (174, 213) and (281, 233).
; PLAN: r0=174(x1), r1=213(y1), r2=281(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 213
LDI r2, 281
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
