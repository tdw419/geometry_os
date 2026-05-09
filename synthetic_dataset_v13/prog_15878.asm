; DESCRIPTION: Draws a red line from (340, 158) to (510, 117).
; PLAN: r0=340(x1), r1=158(y1), r2=510(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 158
LDI r2, 510
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
