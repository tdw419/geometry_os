; DESCRIPTION: Places a red line segment connecting (135, 44) to (176, 209).
; PLAN: r0=135(x1), r1=44(y1), r2=176(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 44
LDI r2, 176
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
