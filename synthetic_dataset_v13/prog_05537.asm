; DESCRIPTION: Draws a white line from (138, 172) to (384, 238).
; PLAN: r0=138(x1), r1=172(y1), r2=384(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 172
LDI r2, 384
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
