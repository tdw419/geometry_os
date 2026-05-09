; DESCRIPTION: Places a red line segment connecting (21, 76) to (480, 231).
; PLAN: r0=21(x1), r1=76(y1), r2=480(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 76
LDI r2, 480
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
