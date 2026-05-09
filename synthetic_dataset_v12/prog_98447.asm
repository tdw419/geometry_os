; DESCRIPTION: Renders a green line between points (344, 113) and (196, 149).
; PLAN: r0=344(x1), r1=113(y1), r2=196(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 113
LDI r2, 196
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
