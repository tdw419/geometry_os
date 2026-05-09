; DESCRIPTION: Renders a cyan line between points (344, 188) and (264, 72).
; PLAN: r0=344(x1), r1=188(y1), r2=264(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 188
LDI r2, 264
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
