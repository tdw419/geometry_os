; DESCRIPTION: Draws a red line from (235, 121) to (480, 175).
; PLAN: r0=235(x1), r1=121(y1), r2=480(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 121
LDI r2, 480
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
