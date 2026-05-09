; DESCRIPTION: Renders a purple line between points (174, 108) and (346, 87).
; PLAN: r0=174(x1), r1=108(y1), r2=346(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 108
LDI r2, 346
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
