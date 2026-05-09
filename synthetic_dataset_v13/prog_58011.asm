; DESCRIPTION: Draws a white line from (138, 153) to (362, 111).
; PLAN: r0=138(x1), r1=153(y1), r2=362(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 153
LDI r2, 362
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
