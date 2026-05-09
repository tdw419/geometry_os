; DESCRIPTION: Draws a red line from (27, 52) to (23, 178).
; PLAN: r0=27(x1), r1=52(y1), r2=23(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 52
LDI r2, 23
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
