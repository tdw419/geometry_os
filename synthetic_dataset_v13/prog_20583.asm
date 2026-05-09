; DESCRIPTION: Renders a green line between points (46, 255) and (266, 151).
; PLAN: r0=46(x1), r1=255(y1), r2=266(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 255
LDI r2, 266
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
