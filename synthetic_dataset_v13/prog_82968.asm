; DESCRIPTION: Draws a red line from (470, 208) to (412, 202).
; PLAN: r0=470(x1), r1=208(y1), r2=412(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 208
LDI r2, 412
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
