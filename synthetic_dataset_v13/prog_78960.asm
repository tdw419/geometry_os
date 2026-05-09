; DESCRIPTION: Draws a white line from (411, 196) to (320, 41).
; PLAN: r0=411(x1), r1=196(y1), r2=320(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 196
LDI r2, 320
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
