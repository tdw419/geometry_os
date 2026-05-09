; DESCRIPTION: Draws a white line from (383, 26) to (368, 93).
; PLAN: r0=383(x1), r1=26(y1), r2=368(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 26
LDI r2, 368
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
