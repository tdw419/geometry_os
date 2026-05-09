; DESCRIPTION: Draws a red line from (241, 108) to (445, 235).
; PLAN: r0=241(x1), r1=108(y1), r2=445(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 108
LDI r2, 445
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
