; DESCRIPTION: Draws a green line from (346, 77) to (411, 88).
; PLAN: r0=346(x1), r1=77(y1), r2=411(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 77
LDI r2, 411
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
