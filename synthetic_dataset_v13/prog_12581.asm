; DESCRIPTION: Renders a magenta line between points (384, 227) and (157, 34).
; PLAN: r0=384(x1), r1=227(y1), r2=157(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 227
LDI r2, 157
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
