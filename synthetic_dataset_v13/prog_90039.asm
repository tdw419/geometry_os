; DESCRIPTION: Draws a black line from (373, 24) to (502, 165).
; PLAN: r0=373(x1), r1=24(y1), r2=502(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 24
LDI r2, 502
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
