; DESCRIPTION: Draws a green line from (309, 47) to (119, 124).
; PLAN: r0=309(x1), r1=47(y1), r2=119(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 47
LDI r2, 119
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
