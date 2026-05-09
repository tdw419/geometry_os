; DESCRIPTION: Draws a green line from (114, 238) to (6, 103).
; PLAN: r0=114(x1), r1=238(y1), r2=6(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 238
LDI r2, 6
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
