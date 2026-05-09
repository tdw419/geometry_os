; DESCRIPTION: Draws a white line from (459, 2) to (87, 107).
; PLAN: r0=459(x1), r1=2(y1), r2=87(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 2
LDI r2, 87
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
