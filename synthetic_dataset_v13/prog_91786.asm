; DESCRIPTION: Draws a white line from (193, 19) to (240, 137).
; PLAN: r0=193(x1), r1=19(y1), r2=240(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 19
LDI r2, 240
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
