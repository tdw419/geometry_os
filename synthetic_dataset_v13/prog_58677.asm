; DESCRIPTION: Renders a cyan line between points (334, 18) and (72, 227).
; PLAN: r0=334(x1), r1=18(y1), r2=72(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 18
LDI r2, 72
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
