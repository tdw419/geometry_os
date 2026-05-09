; DESCRIPTION: Draws a red line from (271, 37) to (410, 165).
; PLAN: r0=271(x1), r1=37(y1), r2=410(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 37
LDI r2, 410
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
