; DESCRIPTION: Draws a black line from (229, 182) to (92, 70).
; PLAN: r0=229(x1), r1=182(y1), r2=92(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 182
LDI r2, 92
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
