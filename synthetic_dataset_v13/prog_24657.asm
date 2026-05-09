; DESCRIPTION: Draws a purple line from (27, 44) to (27, 16).
; PLAN: r0=27(x1), r1=44(y1), r2=27(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 44
LDI r2, 27
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
