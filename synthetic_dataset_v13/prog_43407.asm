; DESCRIPTION: Draws a orange line from (154, 178) to (12, 192).
; PLAN: r0=154(x1), r1=178(y1), r2=12(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 178
LDI r2, 12
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
