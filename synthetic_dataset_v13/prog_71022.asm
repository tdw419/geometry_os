; DESCRIPTION: Renders a red line between points (344, 172) and (259, 215).
; PLAN: r0=344(x1), r1=172(y1), r2=259(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 172
LDI r2, 259
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
