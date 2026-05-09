; DESCRIPTION: Renders a red line between points (259, 153) and (371, 37).
; PLAN: r0=259(x1), r1=153(y1), r2=371(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 153
LDI r2, 371
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
