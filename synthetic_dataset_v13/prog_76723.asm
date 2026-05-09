; DESCRIPTION: Draws a white line from (98, 46) to (174, 241).
; PLAN: r0=98(x1), r1=46(y1), r2=174(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 46
LDI r2, 174
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
