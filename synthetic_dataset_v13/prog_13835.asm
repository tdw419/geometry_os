; DESCRIPTION: Places a red line segment connecting (480, 173) to (345, 130).
; PLAN: r0=480(x1), r1=173(y1), r2=345(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 173
LDI r2, 345
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
