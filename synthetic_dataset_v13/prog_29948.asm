; DESCRIPTION: Draws a yellow line from (458, 16) to (373, 108).
; PLAN: r0=458(x1), r1=16(y1), r2=373(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 16
LDI r2, 373
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
