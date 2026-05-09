; DESCRIPTION: Renders a cyan line between points (44, 168) and (376, 102).
; PLAN: r0=44(x1), r1=168(y1), r2=376(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 168
LDI r2, 376
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
