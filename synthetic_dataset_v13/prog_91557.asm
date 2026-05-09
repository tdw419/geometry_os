; DESCRIPTION: Draws a white line from (52, 127) to (241, 138).
; PLAN: r0=52(x1), r1=127(y1), r2=241(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 127
LDI r2, 241
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
