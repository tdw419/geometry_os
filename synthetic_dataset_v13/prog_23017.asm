; DESCRIPTION: Renders a cyan line between points (35, 91) and (459, 157).
; PLAN: r0=35(x1), r1=91(y1), r2=459(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 91
LDI r2, 459
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
