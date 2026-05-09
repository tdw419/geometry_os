; DESCRIPTION: Draws a cyan line from (405, 217) to (300, 96).
; PLAN: r0=405(x1), r1=217(y1), r2=300(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 217
LDI r2, 300
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
