; DESCRIPTION: Draws a cyan line from (459, 133) to (268, 201).
; PLAN: r0=459(x1), r1=133(y1), r2=268(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 133
LDI r2, 268
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
