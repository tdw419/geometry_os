; DESCRIPTION: Renders a cyan line between points (373, 8) and (73, 186).
; PLAN: r0=373(x1), r1=8(y1), r2=73(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 8
LDI r2, 73
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
