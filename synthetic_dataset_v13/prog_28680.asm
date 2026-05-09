; DESCRIPTION: Draws a white line from (46, 129) to (306, 87).
; PLAN: r0=46(x1), r1=129(y1), r2=306(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 129
LDI r2, 306
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
