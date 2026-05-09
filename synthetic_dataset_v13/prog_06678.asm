; DESCRIPTION: Draws a white line from (310, 223) to (271, 41).
; PLAN: r0=310(x1), r1=223(y1), r2=271(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 223
LDI r2, 271
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
