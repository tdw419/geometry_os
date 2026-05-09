; DESCRIPTION: Draws a cyan line from (40, 40) to (379, 30).
; PLAN: r0=40(x1), r1=40(y1), r2=379(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 40
LDI r2, 379
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
