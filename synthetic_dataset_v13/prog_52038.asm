; DESCRIPTION: Renders a cyan line between points (7, 54) and (344, 244).
; PLAN: r0=7(x1), r1=54(y1), r2=344(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 54
LDI r2, 344
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
