; DESCRIPTION: Draws a green line from (90, 134) to (74, 14).
; PLAN: r0=90(x1), r1=134(y1), r2=74(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 134
LDI r2, 74
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
