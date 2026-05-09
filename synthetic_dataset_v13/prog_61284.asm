; DESCRIPTION: Draws a white line from (130, 220) to (416, 124).
; PLAN: r0=130(x1), r1=220(y1), r2=416(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 220
LDI r2, 416
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
