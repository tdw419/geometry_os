; DESCRIPTION: Draws a green line from (69, 214) to (91, 7).
; PLAN: r0=69(x1), r1=214(y1), r2=91(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 214
LDI r2, 91
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
