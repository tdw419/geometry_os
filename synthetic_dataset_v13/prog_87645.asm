; DESCRIPTION: Draws a red line from (252, 220) to (66, 249).
; PLAN: r0=252(x1), r1=220(y1), r2=66(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 220
LDI r2, 66
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
