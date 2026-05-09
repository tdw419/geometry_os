; DESCRIPTION: Draws a white line from (227, 250) to (482, 210).
; PLAN: r0=227(x1), r1=250(y1), r2=482(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 250
LDI r2, 482
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
