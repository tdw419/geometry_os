; DESCRIPTION: Draws a yellow line from (398, 79) to (207, 179).
; PLAN: r0=398(x1), r1=79(y1), r2=207(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 79
LDI r2, 207
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
