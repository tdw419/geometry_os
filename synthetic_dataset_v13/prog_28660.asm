; DESCRIPTION: Renders a yellow line between points (29, 73) and (173, 187).
; PLAN: r0=29(x1), r1=73(y1), r2=173(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 73
LDI r2, 173
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
