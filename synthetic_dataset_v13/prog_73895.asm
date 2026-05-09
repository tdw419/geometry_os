; DESCRIPTION: Draws a white line from (53, 240) to (466, 32).
; PLAN: r0=53(x1), r1=240(y1), r2=466(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 240
LDI r2, 466
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
