; DESCRIPTION: Draws a green line from (108, 139) to (320, 81).
; PLAN: r0=108(x1), r1=139(y1), r2=320(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 139
LDI r2, 320
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
