; DESCRIPTION: Places a purple line segment connecting (241, 166) to (295, 21).
; PLAN: r0=241(x1), r1=166(y1), r2=295(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 166
LDI r2, 295
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
