; DESCRIPTION: Draws a red line from (4, 6) to (284, 99).
; PLAN: r0=4(x1), r1=6(y1), r2=284(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 6
LDI r2, 284
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
