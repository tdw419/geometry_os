; DESCRIPTION: Renders a cyan line between points (265, 124) and (13, 250).
; PLAN: r0=265(x1), r1=124(y1), r2=13(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 124
LDI r2, 13
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
