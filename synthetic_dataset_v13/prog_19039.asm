; DESCRIPTION: Draws a red line from (274, 187) to (281, 216).
; PLAN: r0=274(x1), r1=187(y1), r2=281(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 187
LDI r2, 281
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
