; DESCRIPTION: Draws a red line from (510, 175) to (103, 40).
; PLAN: r0=510(x1), r1=175(y1), r2=103(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 175
LDI r2, 103
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
