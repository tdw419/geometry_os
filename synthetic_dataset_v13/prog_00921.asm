; DESCRIPTION: Draws a orange line from (264, 242) to (23, 168).
; PLAN: r0=264(x1), r1=242(y1), r2=23(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 242
LDI r2, 23
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
