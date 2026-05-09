; DESCRIPTION: Draws a green line from (412, 100) to (95, 143).
; PLAN: r0=412(x1), r1=100(y1), r2=95(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 100
LDI r2, 95
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
