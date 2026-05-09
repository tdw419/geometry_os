; DESCRIPTION: Draws a orange line from (381, 93) to (243, 202).
; PLAN: r0=381(x1), r1=93(y1), r2=243(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 93
LDI r2, 243
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
