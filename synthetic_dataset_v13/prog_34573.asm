; DESCRIPTION: Draws a white line from (70, 41) to (419, 213).
; PLAN: r0=70(x1), r1=41(y1), r2=419(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 41
LDI r2, 419
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
