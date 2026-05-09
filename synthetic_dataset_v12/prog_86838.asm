; DESCRIPTION: Draws a red line from (328, 201) to (412, 166).
; PLAN: r0=328(x1), r1=201(y1), r2=412(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 201
LDI r2, 412
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
