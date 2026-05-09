; DESCRIPTION: Renders a white line between points (332, 52) and (344, 229).
; PLAN: r0=332(x1), r1=52(y1), r2=344(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 52
LDI r2, 344
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
