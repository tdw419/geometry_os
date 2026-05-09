; DESCRIPTION: Draws a white line from (352, 142) to (75, 107).
; PLAN: r0=352(x1), r1=142(y1), r2=75(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 142
LDI r2, 75
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
