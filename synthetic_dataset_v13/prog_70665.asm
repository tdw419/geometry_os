; DESCRIPTION: Draws a green line from (151, 71) to (461, 243).
; PLAN: r0=151(x1), r1=71(y1), r2=461(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 71
LDI r2, 461
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
