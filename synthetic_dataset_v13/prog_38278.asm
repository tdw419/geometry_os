; DESCRIPTION: Renders a cyan line between points (376, 36) and (211, 151).
; PLAN: r0=376(x1), r1=36(y1), r2=211(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 36
LDI r2, 211
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
