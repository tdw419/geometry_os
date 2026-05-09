; DESCRIPTION: Draws a green line from (284, 145) to (124, 61).
; PLAN: r0=284(x1), r1=145(y1), r2=124(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 145
LDI r2, 124
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
