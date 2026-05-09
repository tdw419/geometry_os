; DESCRIPTION: Places a black line segment connecting (103, 146) to (362, 74).
; PLAN: r0=103(x1), r1=146(y1), r2=362(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 146
LDI r2, 362
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
