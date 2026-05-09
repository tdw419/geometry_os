; DESCRIPTION: Renders a cyan line between points (424, 34) and (156, 182).
; PLAN: r0=424(x1), r1=34(y1), r2=156(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 34
LDI r2, 156
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
