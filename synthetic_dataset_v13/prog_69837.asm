; DESCRIPTION: Draws a green line from (309, 203) to (179, 55).
; PLAN: r0=309(x1), r1=203(y1), r2=179(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 203
LDI r2, 179
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
