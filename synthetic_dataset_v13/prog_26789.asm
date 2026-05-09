; DESCRIPTION: Draws a cyan line from (14, 250) to (455, 201).
; PLAN: r0=14(x1), r1=250(y1), r2=455(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 250
LDI r2, 455
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
