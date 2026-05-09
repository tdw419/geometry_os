; DESCRIPTION: Draws a red line from (161, 207) to (127, 138).
; PLAN: r0=161(x1), r1=207(y1), r2=127(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 207
LDI r2, 127
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
