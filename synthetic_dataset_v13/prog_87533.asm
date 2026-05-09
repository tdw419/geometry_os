; DESCRIPTION: Renders a cyan line between points (385, 78) and (135, 187).
; PLAN: r0=385(x1), r1=78(y1), r2=135(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 78
LDI r2, 135
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
