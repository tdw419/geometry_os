; DESCRIPTION: Draws a white line from (493, 15) to (93, 255).
; PLAN: r0=493(x1), r1=15(y1), r2=93(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 15
LDI r2, 93
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
