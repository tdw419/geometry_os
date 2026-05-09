; DESCRIPTION: Draws a white line from (8, 203) to (32, 51).
; PLAN: r0=8(x1), r1=203(y1), r2=32(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 203
LDI r2, 32
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
