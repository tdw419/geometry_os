; DESCRIPTION: Renders a white line between points (276, 102) and (209, 202).
; PLAN: r0=276(x1), r1=102(y1), r2=209(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 102
LDI r2, 209
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
