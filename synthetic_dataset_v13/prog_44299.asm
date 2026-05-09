; DESCRIPTION: Draws a white line from (165, 81) to (113, 171).
; PLAN: r0=165(x1), r1=81(y1), r2=113(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 81
LDI r2, 113
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
