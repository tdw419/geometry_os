; DESCRIPTION: Draws a red line from (53, 13) to (320, 108).
; PLAN: r0=53(x1), r1=13(y1), r2=320(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 13
LDI r2, 320
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
