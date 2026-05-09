; DESCRIPTION: Draws a blue line from (284, 40) to (154, 211).
; PLAN: r0=284(x1), r1=40(y1), r2=154(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 40
LDI r2, 154
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
