; DESCRIPTION: Draws a white line from (251, 202) to (225, 107).
; PLAN: r0=251(x1), r1=202(y1), r2=225(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 202
LDI r2, 225
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
