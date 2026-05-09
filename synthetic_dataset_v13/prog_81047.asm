; DESCRIPTION: Draws a cyan line from (325, 217) to (4, 164).
; PLAN: r0=325(x1), r1=217(y1), r2=4(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 217
LDI r2, 4
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
