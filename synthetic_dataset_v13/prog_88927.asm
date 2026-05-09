; DESCRIPTION: Draws a green line from (303, 196) to (342, 150).
; PLAN: r0=303(x1), r1=196(y1), r2=342(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 196
LDI r2, 342
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
