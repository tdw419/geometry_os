; DESCRIPTION: Renders a magenta line between points (296, 236) and (344, 138).
; PLAN: r0=296(x1), r1=236(y1), r2=344(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 236
LDI r2, 344
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
