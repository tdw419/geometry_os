; DESCRIPTION: Places a yellow line segment connecting (491, 182) to (295, 167).
; PLAN: r0=491(x1), r1=182(y1), r2=295(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 182
LDI r2, 295
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
