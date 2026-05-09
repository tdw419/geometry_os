; DESCRIPTION: Draws a red line from (405, 255) to (489, 57).
; PLAN: r0=405(x1), r1=255(y1), r2=489(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 255
LDI r2, 489
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
