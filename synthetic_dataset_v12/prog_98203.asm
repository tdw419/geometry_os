; DESCRIPTION: Draws a red line from (143, 233) to (280, 107).
; PLAN: r0=143(x1), r1=233(y1), r2=280(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 233
LDI r2, 280
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
