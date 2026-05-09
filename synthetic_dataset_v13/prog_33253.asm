; DESCRIPTION: Draws a white line from (175, 235) to (156, 138).
; PLAN: r0=175(x1), r1=235(y1), r2=156(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 235
LDI r2, 156
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
