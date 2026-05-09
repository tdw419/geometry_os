; DESCRIPTION: Renders a cyan line between points (264, 143) and (275, 78).
; PLAN: r0=264(x1), r1=143(y1), r2=275(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 143
LDI r2, 275
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
