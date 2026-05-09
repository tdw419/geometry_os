; DESCRIPTION: Draws a yellow line from (495, 109) to (450, 160).
; PLAN: r0=495(x1), r1=109(y1), r2=450(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 109
LDI r2, 450
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
