; DESCRIPTION: Draws a white line from (130, 139) to (254, 243).
; PLAN: r0=130(x1), r1=139(y1), r2=254(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 139
LDI r2, 254
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
