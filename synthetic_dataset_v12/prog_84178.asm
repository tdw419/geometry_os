; DESCRIPTION: Draws a green line from (305, 75) to (391, 13).
; PLAN: r0=305(x1), r1=75(y1), r2=391(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 75
LDI r2, 391
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
