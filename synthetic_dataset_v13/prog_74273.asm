; DESCRIPTION: Renders a white line between points (239, 34) and (344, 220).
; PLAN: r0=239(x1), r1=34(y1), r2=344(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 34
LDI r2, 344
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
