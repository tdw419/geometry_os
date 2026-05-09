; DESCRIPTION: Draws a green line from (350, 74) to (455, 92).
; PLAN: r0=350(x1), r1=74(y1), r2=455(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 74
LDI r2, 455
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
