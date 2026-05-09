; DESCRIPTION: Draws a yellow line from (456, 139) to (206, 76).
; PLAN: r0=456(x1), r1=139(y1), r2=206(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 139
LDI r2, 206
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
