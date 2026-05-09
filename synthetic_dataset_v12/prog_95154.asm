; DESCRIPTION: Draws a red line from (130, 95) to (263, 37).
; PLAN: r0=130(x1), r1=95(y1), r2=263(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 95
LDI r2, 263
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
