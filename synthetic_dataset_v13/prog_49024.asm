; DESCRIPTION: Draws a yellow line from (459, 141) to (103, 27).
; PLAN: r0=459(x1), r1=141(y1), r2=103(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 141
LDI r2, 103
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
