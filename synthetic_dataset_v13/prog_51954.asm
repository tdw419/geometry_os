; DESCRIPTION: Places a yellow line segment connecting (76, 221) to (243, 139).
; PLAN: r0=76(x1), r1=221(y1), r2=243(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 221
LDI r2, 243
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
