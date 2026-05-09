; DESCRIPTION: Draws a orange line from (410, 16) to (336, 153).
; PLAN: r0=410(x1), r1=16(y1), r2=336(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 16
LDI r2, 336
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
