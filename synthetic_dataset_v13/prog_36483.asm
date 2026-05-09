; DESCRIPTION: Draws a red line from (108, 58) to (508, 55).
; PLAN: r0=108(x1), r1=58(y1), r2=508(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 58
LDI r2, 508
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
