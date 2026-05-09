; DESCRIPTION: Draws a red line from (411, 196) to (37, 60).
; PLAN: r0=411(x1), r1=196(y1), r2=37(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 196
LDI r2, 37
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
