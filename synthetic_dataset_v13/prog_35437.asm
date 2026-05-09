; DESCRIPTION: Places a red line segment connecting (492, 195) to (87, 153).
; PLAN: r0=492(x1), r1=195(y1), r2=87(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 195
LDI r2, 87
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
