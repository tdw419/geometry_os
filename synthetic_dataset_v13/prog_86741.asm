; DESCRIPTION: Places a cyan line segment connecting (101, 97) to (497, 195).
; PLAN: r0=101(x1), r1=97(y1), r2=497(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 97
LDI r2, 497
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
