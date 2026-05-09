; DESCRIPTION: Draws a green line from (142, 233) to (360, 28).
; PLAN: r0=142(x1), r1=233(y1), r2=360(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 233
LDI r2, 360
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
