; DESCRIPTION: Renders a cyan line between points (378, 54) and (217, 5).
; PLAN: r0=378(x1), r1=54(y1), r2=217(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 54
LDI r2, 217
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
