; DESCRIPTION: Draws a red line from (384, 26) to (410, 247).
; PLAN: r0=384(x1), r1=26(y1), r2=410(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 26
LDI r2, 410
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
