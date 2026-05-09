; DESCRIPTION: Draws a white line from (105, 149) to (389, 173).
; PLAN: r0=105(x1), r1=149(y1), r2=389(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 149
LDI r2, 389
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
