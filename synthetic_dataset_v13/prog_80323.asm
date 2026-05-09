; DESCRIPTION: Draws a yellow line from (154, 74) to (323, 152).
; PLAN: r0=154(x1), r1=74(y1), r2=323(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 74
LDI r2, 323
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
