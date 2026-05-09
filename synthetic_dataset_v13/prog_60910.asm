; DESCRIPTION: Draws a red line from (392, 72) to (216, 253).
; PLAN: r0=392(x1), r1=72(y1), r2=216(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 72
LDI r2, 216
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
