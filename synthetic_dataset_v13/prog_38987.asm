; DESCRIPTION: Draws a red line from (412, 62) to (69, 143).
; PLAN: r0=412(x1), r1=62(y1), r2=69(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 62
LDI r2, 69
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
