; DESCRIPTION: Draws a yellow line from (271, 15) to (284, 251).
; PLAN: r0=271(x1), r1=15(y1), r2=284(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 15
LDI r2, 284
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
