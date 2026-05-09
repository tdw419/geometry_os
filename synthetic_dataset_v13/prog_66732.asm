; DESCRIPTION: Draws a green line from (130, 44) to (33, 38).
; PLAN: r0=130(x1), r1=44(y1), r2=33(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 44
LDI r2, 33
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
