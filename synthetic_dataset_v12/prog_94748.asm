; DESCRIPTION: Renders a green line between points (263, 96) and (344, 141).
; PLAN: r0=263(x1), r1=96(y1), r2=344(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 96
LDI r2, 344
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
