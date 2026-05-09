; DESCRIPTION: Draws a white line from (471, 111) to (373, 127).
; PLAN: r0=471(x1), r1=111(y1), r2=373(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 111
LDI r2, 373
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
