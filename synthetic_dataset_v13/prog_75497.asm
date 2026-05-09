; DESCRIPTION: Draws a green line from (103, 50) to (185, 29).
; PLAN: r0=103(x1), r1=50(y1), r2=185(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 50
LDI r2, 185
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
