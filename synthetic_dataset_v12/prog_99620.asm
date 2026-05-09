; DESCRIPTION: Renders a yellow line between points (112, 167) and (207, 113).
; PLAN: r0=112(x1), r1=167(y1), r2=207(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 167
LDI r2, 207
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
