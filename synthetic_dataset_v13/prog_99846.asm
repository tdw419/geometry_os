; DESCRIPTION: Draws a white line from (6, 126) to (187, 106).
; PLAN: r0=6(x1), r1=126(y1), r2=187(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 126
LDI r2, 187
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
