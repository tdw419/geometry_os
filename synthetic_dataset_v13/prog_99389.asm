; DESCRIPTION: Draws a cyan line from (495, 75) to (217, 201).
; PLAN: r0=495(x1), r1=75(y1), r2=217(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 75
LDI r2, 217
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
