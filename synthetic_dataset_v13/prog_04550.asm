; DESCRIPTION: Draws a blue line from (415, 41) to (114, 213).
; PLAN: r0=415(x1), r1=41(y1), r2=114(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 41
LDI r2, 114
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
