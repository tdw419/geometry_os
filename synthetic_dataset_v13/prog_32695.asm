; DESCRIPTION: Renders a magenta line between points (436, 220) and (217, 241).
; PLAN: r0=436(x1), r1=220(y1), r2=217(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 220
LDI r2, 217
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
