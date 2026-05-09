; DESCRIPTION: Draws a yellow line from (173, 85) to (4, 19).
; PLAN: r0=173(x1), r1=85(y1), r2=4(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 85
LDI r2, 4
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
