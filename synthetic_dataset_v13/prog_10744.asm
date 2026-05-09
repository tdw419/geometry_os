; DESCRIPTION: Renders a cyan line between points (273, 145) and (466, 182).
; PLAN: r0=273(x1), r1=145(y1), r2=466(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 145
LDI r2, 466
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
