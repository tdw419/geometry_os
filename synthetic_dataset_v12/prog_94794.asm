; DESCRIPTION: Places a red line segment connecting (66, 237) to (278, 103).
; PLAN: r0=66(x1), r1=237(y1), r2=278(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 237
LDI r2, 278
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
