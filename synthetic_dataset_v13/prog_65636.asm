; DESCRIPTION: Draws a red line from (0, 48) to (370, 25).
; PLAN: r0=0(x1), r1=48(y1), r2=370(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 48
LDI r2, 370
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
