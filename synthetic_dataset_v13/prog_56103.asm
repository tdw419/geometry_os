; DESCRIPTION: Draws a yellow line from (23, 207) to (87, 38).
; PLAN: r0=23(x1), r1=207(y1), r2=87(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 207
LDI r2, 87
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
