; DESCRIPTION: Renders a cyan line between points (376, 140) and (425, 99).
; PLAN: r0=376(x1), r1=140(y1), r2=425(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 140
LDI r2, 425
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
