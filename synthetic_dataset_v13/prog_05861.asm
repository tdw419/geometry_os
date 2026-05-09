; DESCRIPTION: Draws a red line from (5, 132) to (240, 237).
; PLAN: r0=5(x1), r1=132(y1), r2=240(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 132
LDI r2, 240
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
