; DESCRIPTION: Draws a red line from (139, 21) to (196, 150).
; PLAN: r0=139(x1), r1=21(y1), r2=196(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 21
LDI r2, 196
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
