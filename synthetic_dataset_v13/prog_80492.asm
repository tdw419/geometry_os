; DESCRIPTION: Renders a cyan line between points (172, 225) and (39, 40).
; PLAN: r0=172(x1), r1=225(y1), r2=39(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 225
LDI r2, 39
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
