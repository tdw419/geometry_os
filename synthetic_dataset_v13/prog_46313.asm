; DESCRIPTION: Renders a cyan line between points (195, 230) and (447, 58).
; PLAN: r0=195(x1), r1=230(y1), r2=447(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 230
LDI r2, 447
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
