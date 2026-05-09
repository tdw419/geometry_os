; DESCRIPTION: Draws a orange line from (175, 93) to (77, 195).
; PLAN: r0=175(x1), r1=93(y1), r2=77(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 93
LDI r2, 77
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
