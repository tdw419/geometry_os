; DESCRIPTION: Draws a green line from (110, 57) to (117, 37).
; PLAN: r0=110(x1), r1=57(y1), r2=117(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 57
LDI r2, 117
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
