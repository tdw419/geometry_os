; DESCRIPTION: Draws a cyan line from (459, 92) to (436, 251).
; PLAN: r0=459(x1), r1=92(y1), r2=436(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 92
LDI r2, 436
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
