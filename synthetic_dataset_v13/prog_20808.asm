; DESCRIPTION: Draws a orange line from (216, 32) to (434, 154).
; PLAN: r0=216(x1), r1=32(y1), r2=434(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 32
LDI r2, 434
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
