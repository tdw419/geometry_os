; DESCRIPTION: Draws a white line from (500, 41) to (320, 23).
; PLAN: r0=500(x1), r1=41(y1), r2=320(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 41
LDI r2, 320
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
