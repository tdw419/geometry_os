; DESCRIPTION: Draws a green line from (4, 104) to (465, 102).
; PLAN: r0=4(x1), r1=104(y1), r2=465(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 104
LDI r2, 465
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
