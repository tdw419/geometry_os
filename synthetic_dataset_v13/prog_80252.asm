; DESCRIPTION: Draws a red line from (254, 158) to (235, 213).
; PLAN: r0=254(x1), r1=158(y1), r2=235(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 158
LDI r2, 235
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
