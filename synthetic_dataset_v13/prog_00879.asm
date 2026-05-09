; DESCRIPTION: Draws a red line from (383, 111) to (505, 253).
; PLAN: r0=383(x1), r1=111(y1), r2=505(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 111
LDI r2, 505
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
