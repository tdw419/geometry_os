; DESCRIPTION: Renders a red line between points (403, 62) and (504, 151).
; PLAN: r0=403(x1), r1=62(y1), r2=504(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 62
LDI r2, 504
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
