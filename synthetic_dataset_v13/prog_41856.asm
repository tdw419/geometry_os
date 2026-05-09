; DESCRIPTION: Renders a purple line between points (174, 3) and (280, 236).
; PLAN: r0=174(x1), r1=3(y1), r2=280(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 3
LDI r2, 280
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
