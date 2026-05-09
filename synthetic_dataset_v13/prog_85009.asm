; DESCRIPTION: Draws a white line from (121, 168) to (453, 126).
; PLAN: r0=121(x1), r1=168(y1), r2=453(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 168
LDI r2, 453
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
