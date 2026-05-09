; DESCRIPTION: Renders a white line between points (38, 214) and (344, 240).
; PLAN: r0=38(x1), r1=214(y1), r2=344(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 214
LDI r2, 344
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
