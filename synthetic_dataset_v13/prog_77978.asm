; DESCRIPTION: Draws a green line from (490, 0) to (284, 29).
; PLAN: r0=490(x1), r1=0(y1), r2=284(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 0
LDI r2, 284
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
