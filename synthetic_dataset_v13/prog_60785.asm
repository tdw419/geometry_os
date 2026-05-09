; DESCRIPTION: Draws a white line from (29, 52) to (48, 152).
; PLAN: r0=29(x1), r1=52(y1), r2=48(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 52
LDI r2, 48
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
