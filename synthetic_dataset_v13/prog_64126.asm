; DESCRIPTION: Draws a red line from (57, 99) to (467, 243).
; PLAN: r0=57(x1), r1=99(y1), r2=467(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 99
LDI r2, 467
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
