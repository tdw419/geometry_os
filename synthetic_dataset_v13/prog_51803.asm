; DESCRIPTION: Draws a yellow line from (346, 5) to (69, 110).
; PLAN: r0=346(x1), r1=5(y1), r2=69(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 5
LDI r2, 69
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
