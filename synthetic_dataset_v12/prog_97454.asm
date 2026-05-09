; DESCRIPTION: Draws a white line from (325, 20) to (482, 47).
; PLAN: r0=325(x1), r1=20(y1), r2=482(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 20
LDI r2, 482
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
