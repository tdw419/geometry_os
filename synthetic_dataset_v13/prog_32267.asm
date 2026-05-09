; DESCRIPTION: Places a red line segment connecting (57, 13) to (29, 209).
; PLAN: r0=57(x1), r1=13(y1), r2=29(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 13
LDI r2, 29
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
