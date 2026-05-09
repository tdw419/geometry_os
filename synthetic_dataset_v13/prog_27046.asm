; DESCRIPTION: Draws a green line from (361, 23) to (146, 251).
; PLAN: r0=361(x1), r1=23(y1), r2=146(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 23
LDI r2, 146
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
