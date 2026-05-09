; DESCRIPTION: Renders a cyan line between points (273, 114) and (373, 22).
; PLAN: r0=273(x1), r1=114(y1), r2=373(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 114
LDI r2, 373
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
