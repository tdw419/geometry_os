; DESCRIPTION: Renders a cyan line between points (299, 126) and (129, 75).
; PLAN: r0=299(x1), r1=126(y1), r2=129(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 126
LDI r2, 129
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
