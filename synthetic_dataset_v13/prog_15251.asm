; DESCRIPTION: Draws a red line from (398, 106) to (235, 153).
; PLAN: r0=398(x1), r1=106(y1), r2=235(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 106
LDI r2, 235
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
