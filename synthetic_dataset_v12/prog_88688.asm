; DESCRIPTION: Draws a red line from (508, 59) to (255, 101).
; PLAN: r0=508(x1), r1=59(y1), r2=255(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 59
LDI r2, 255
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
