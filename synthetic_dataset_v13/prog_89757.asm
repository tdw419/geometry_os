; DESCRIPTION: Draws a purple line from (394, 186) to (440, 191).
; PLAN: r0=394(x1), r1=186(y1), r2=440(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 186
LDI r2, 440
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
