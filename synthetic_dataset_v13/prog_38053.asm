; DESCRIPTION: Draws a yellow line from (415, 85) to (259, 195).
; PLAN: r0=415(x1), r1=85(y1), r2=259(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 85
LDI r2, 259
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
