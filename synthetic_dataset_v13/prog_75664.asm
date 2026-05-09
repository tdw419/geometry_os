; DESCRIPTION: Draws a orange line from (284, 4) to (197, 88).
; PLAN: r0=284(x1), r1=4(y1), r2=197(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 4
LDI r2, 197
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
