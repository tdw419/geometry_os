; DESCRIPTION: Draws a red line from (480, 76) to (291, 190).
; PLAN: r0=480(x1), r1=76(y1), r2=291(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 76
LDI r2, 291
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
