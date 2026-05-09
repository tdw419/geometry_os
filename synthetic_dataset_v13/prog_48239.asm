; DESCRIPTION: Renders a cyan line between points (504, 241) and (273, 153).
; PLAN: r0=504(x1), r1=241(y1), r2=273(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 241
LDI r2, 273
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
