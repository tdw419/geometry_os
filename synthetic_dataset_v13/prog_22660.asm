; DESCRIPTION: Draws a white line from (409, 21) to (416, 20).
; PLAN: r0=409(x1), r1=21(y1), r2=416(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 21
LDI r2, 416
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
