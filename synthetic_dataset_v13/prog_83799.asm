; DESCRIPTION: Draws a purple line from (173, 47) to (41, 107).
; PLAN: r0=173(x1), r1=47(y1), r2=41(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 47
LDI r2, 41
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
