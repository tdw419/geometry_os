; DESCRIPTION: Renders a magenta line between points (344, 172) and (460, 233).
; PLAN: r0=344(x1), r1=172(y1), r2=460(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 172
LDI r2, 460
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
