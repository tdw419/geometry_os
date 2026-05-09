; DESCRIPTION: Draws a green line from (133, 248) to (426, 55).
; PLAN: r0=133(x1), r1=248(y1), r2=426(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 248
LDI r2, 426
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
