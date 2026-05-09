; DESCRIPTION: Draws a white line from (22, 119) to (215, 113).
; PLAN: r0=22(x1), r1=119(y1), r2=215(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 119
LDI r2, 215
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
