; DESCRIPTION: Renders a cyan line between points (208, 27) and (319, 116).
; PLAN: r0=208(x1), r1=27(y1), r2=319(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 27
LDI r2, 319
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
