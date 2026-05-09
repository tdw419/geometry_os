; DESCRIPTION: Renders a cyan line between points (486, 112) and (48, 248).
; PLAN: r0=486(x1), r1=112(y1), r2=48(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 112
LDI r2, 48
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
