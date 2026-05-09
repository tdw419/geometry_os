; DESCRIPTION: Draws a red line from (356, 3) to (23, 117).
; PLAN: r0=356(x1), r1=3(y1), r2=23(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 3
LDI r2, 23
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
