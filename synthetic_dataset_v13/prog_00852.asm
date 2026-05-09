; DESCRIPTION: Draws a white line from (389, 177) to (173, 37).
; PLAN: r0=389(x1), r1=177(y1), r2=173(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 177
LDI r2, 173
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
