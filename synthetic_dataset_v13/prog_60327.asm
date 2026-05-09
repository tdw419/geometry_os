; DESCRIPTION: Draws a yellow line from (305, 207) to (3, 86).
; PLAN: r0=305(x1), r1=207(y1), r2=3(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 207
LDI r2, 3
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
