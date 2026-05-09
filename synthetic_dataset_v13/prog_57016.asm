; DESCRIPTION: Draws a white line from (482, 55) to (119, 120).
; PLAN: r0=482(x1), r1=55(y1), r2=119(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 55
LDI r2, 119
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
