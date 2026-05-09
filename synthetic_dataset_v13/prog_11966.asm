; DESCRIPTION: Draws a red line from (105, 35) to (435, 146).
; PLAN: r0=105(x1), r1=35(y1), r2=435(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 35
LDI r2, 435
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
