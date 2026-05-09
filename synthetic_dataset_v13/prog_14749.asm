; DESCRIPTION: Draws a white line from (412, 164) to (107, 53).
; PLAN: r0=412(x1), r1=164(y1), r2=107(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 164
LDI r2, 107
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
