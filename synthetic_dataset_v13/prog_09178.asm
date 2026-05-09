; DESCRIPTION: Draws a yellow line from (459, 9) to (373, 117).
; PLAN: r0=459(x1), r1=9(y1), r2=373(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 9
LDI r2, 373
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
