; DESCRIPTION: Draws a red line from (480, 6) to (259, 59).
; PLAN: r0=480(x1), r1=6(y1), r2=259(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 6
LDI r2, 259
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
