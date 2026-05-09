; DESCRIPTION: Draws a white line from (187, 78) to (466, 40).
; PLAN: r0=187(x1), r1=78(y1), r2=466(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 78
LDI r2, 466
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
