; DESCRIPTION: Draws a red line from (187, 9) to (327, 216).
; PLAN: r0=187(x1), r1=9(y1), r2=327(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 9
LDI r2, 327
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
