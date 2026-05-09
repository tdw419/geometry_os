; DESCRIPTION: Draws a white line from (103, 168) to (306, 115).
; PLAN: r0=103(x1), r1=168(y1), r2=306(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 168
LDI r2, 306
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
