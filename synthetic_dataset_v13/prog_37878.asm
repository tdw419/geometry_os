; DESCRIPTION: Draws a black line from (494, 133) to (450, 26).
; PLAN: r0=494(x1), r1=133(y1), r2=450(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 133
LDI r2, 450
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
