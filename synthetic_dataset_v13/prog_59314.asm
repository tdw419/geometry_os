; DESCRIPTION: Draws a white line from (482, 158) to (66, 188).
; PLAN: r0=482(x1), r1=158(y1), r2=66(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 158
LDI r2, 66
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
