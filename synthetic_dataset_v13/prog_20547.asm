; DESCRIPTION: Draws a white line from (303, 234) to (460, 60).
; PLAN: r0=303(x1), r1=234(y1), r2=460(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 234
LDI r2, 460
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
