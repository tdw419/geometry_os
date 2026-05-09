; DESCRIPTION: Renders a purple line between points (346, 144) and (251, 186).
; PLAN: r0=346(x1), r1=144(y1), r2=251(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 144
LDI r2, 251
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
