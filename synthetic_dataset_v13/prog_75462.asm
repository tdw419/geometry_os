; DESCRIPTION: Draws a black line from (309, 95) to (135, 68).
; PLAN: r0=309(x1), r1=95(y1), r2=135(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 95
LDI r2, 135
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
