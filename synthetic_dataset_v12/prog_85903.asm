; DESCRIPTION: Renders a yellow line between points (174, 74) and (436, 83).
; PLAN: r0=174(x1), r1=74(y1), r2=436(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 74
LDI r2, 436
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
