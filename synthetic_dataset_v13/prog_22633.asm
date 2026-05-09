; DESCRIPTION: Draws a red line from (426, 82) to (455, 174).
; PLAN: r0=426(x1), r1=82(y1), r2=455(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 82
LDI r2, 455
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
