; DESCRIPTION: Draws a red line from (292, 187) to (39, 207).
; PLAN: r0=292(x1), r1=187(y1), r2=39(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 187
LDI r2, 39
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
