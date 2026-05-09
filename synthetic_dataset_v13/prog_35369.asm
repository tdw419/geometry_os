; DESCRIPTION: Draws a yellow line from (465, 111) to (132, 61).
; PLAN: r0=465(x1), r1=111(y1), r2=132(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 111
LDI r2, 132
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
