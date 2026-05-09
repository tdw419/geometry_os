; DESCRIPTION: Draws a red line from (242, 108) to (203, 43).
; PLAN: r0=242(x1), r1=108(y1), r2=203(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 108
LDI r2, 203
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
