; DESCRIPTION: Renders a cyan line between points (328, 102) and (83, 15).
; PLAN: r0=328(x1), r1=102(y1), r2=83(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 102
LDI r2, 83
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
