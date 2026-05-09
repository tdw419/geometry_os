; DESCRIPTION: Draws a cyan line from (74, 3) to (476, 195).
; PLAN: r0=74(x1), r1=3(y1), r2=476(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 3
LDI r2, 476
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
