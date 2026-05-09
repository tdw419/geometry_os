; DESCRIPTION: Draws a white line from (322, 206) to (101, 12).
; PLAN: r0=322(x1), r1=206(y1), r2=101(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 206
LDI r2, 101
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
