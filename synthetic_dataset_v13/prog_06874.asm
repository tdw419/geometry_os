; DESCRIPTION: Places a red line segment connecting (444, 173) to (480, 175).
; PLAN: r0=444(x1), r1=173(y1), r2=480(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 173
LDI r2, 480
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
