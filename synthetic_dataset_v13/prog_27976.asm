; DESCRIPTION: Renders a cyan line between points (11, 233) and (323, 202).
; PLAN: r0=11(x1), r1=233(y1), r2=323(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 233
LDI r2, 323
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
