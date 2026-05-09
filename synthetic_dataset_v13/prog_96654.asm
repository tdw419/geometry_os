; DESCRIPTION: Renders a green line between points (71, 149) and (492, 151).
; PLAN: r0=71(x1), r1=149(y1), r2=492(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 149
LDI r2, 492
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
