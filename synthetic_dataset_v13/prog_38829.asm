; DESCRIPTION: Draws a yellow line from (138, 205) to (235, 244).
; PLAN: r0=138(x1), r1=205(y1), r2=235(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 205
LDI r2, 235
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
