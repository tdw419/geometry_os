; DESCRIPTION: Draws a red line from (482, 77) to (178, 164).
; PLAN: r0=482(x1), r1=77(y1), r2=178(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 77
LDI r2, 178
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
