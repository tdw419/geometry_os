; DESCRIPTION: Renders a purple line between points (186, 143) and (152, 195).
; PLAN: r0=186(x1), r1=143(y1), r2=152(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 143
LDI r2, 152
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
