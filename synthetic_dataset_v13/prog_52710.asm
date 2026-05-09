; DESCRIPTION: Draws a cyan line from (49, 217) to (256, 169).
; PLAN: r0=49(x1), r1=217(y1), r2=256(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 217
LDI r2, 256
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
