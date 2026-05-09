; DESCRIPTION: Draws a white line from (426, 108) to (354, 235).
; PLAN: r0=426(x1), r1=108(y1), r2=354(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 108
LDI r2, 354
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
