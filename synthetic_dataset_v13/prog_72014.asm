; DESCRIPTION: Renders a red line between points (504, 48) and (326, 170).
; PLAN: r0=504(x1), r1=48(y1), r2=326(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 48
LDI r2, 326
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
