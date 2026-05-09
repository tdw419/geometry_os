; DESCRIPTION: Renders a cyan line between points (318, 247) and (166, 52).
; PLAN: r0=318(x1), r1=247(y1), r2=166(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 247
LDI r2, 166
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
