; DESCRIPTION: Draws a white line from (373, 44) to (309, 142).
; PLAN: r0=373(x1), r1=44(y1), r2=309(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 44
LDI r2, 309
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
