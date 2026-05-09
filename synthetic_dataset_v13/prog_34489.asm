; DESCRIPTION: Renders a cyan line between points (491, 154) and (62, 151).
; PLAN: r0=491(x1), r1=154(y1), r2=62(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 154
LDI r2, 62
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
