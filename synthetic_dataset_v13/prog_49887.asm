; DESCRIPTION: Draws a yellow line from (284, 44) to (241, 31).
; PLAN: r0=284(x1), r1=44(y1), r2=241(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 44
LDI r2, 241
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
