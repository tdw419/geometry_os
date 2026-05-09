; DESCRIPTION: Renders a cyan line between points (465, 28) and (503, 97).
; PLAN: r0=465(x1), r1=28(y1), r2=503(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 28
LDI r2, 503
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
