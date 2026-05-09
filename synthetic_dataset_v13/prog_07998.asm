; DESCRIPTION: Renders a white line between points (133, 202) and (384, 121).
; PLAN: r0=133(x1), r1=202(y1), r2=384(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 202
LDI r2, 384
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
