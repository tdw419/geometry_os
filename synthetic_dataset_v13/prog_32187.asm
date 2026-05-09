; DESCRIPTION: Renders a yellow line between points (384, 141) and (420, 166).
; PLAN: r0=384(x1), r1=141(y1), r2=420(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 141
LDI r2, 420
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
