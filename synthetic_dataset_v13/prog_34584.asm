; DESCRIPTION: Renders a green line between points (79, 226) and (309, 69).
; PLAN: r0=79(x1), r1=226(y1), r2=309(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 226
LDI r2, 309
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
