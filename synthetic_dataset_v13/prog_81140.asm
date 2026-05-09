; DESCRIPTION: Renders a cyan line between points (144, 225) and (7, 124).
; PLAN: r0=144(x1), r1=225(y1), r2=7(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 225
LDI r2, 7
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
