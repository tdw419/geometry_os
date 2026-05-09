; DESCRIPTION: Draws a white line from (41, 206) to (454, 215).
; PLAN: r0=41(x1), r1=206(y1), r2=454(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 206
LDI r2, 454
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
