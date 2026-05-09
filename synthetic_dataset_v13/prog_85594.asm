; DESCRIPTION: Draws a green line from (25, 69) to (345, 124).
; PLAN: r0=25(x1), r1=69(y1), r2=345(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 69
LDI r2, 345
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
