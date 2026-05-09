; DESCRIPTION: Draws a yellow line from (428, 207) to (408, 32).
; PLAN: r0=428(x1), r1=207(y1), r2=408(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 207
LDI r2, 408
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
