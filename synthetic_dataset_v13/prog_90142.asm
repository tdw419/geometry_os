; DESCRIPTION: Renders a cyan line between points (58, 102) and (342, 57).
; PLAN: r0=58(x1), r1=102(y1), r2=342(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 102
LDI r2, 342
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
