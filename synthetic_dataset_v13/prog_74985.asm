; DESCRIPTION: Draws a yellow line from (465, 248) to (235, 99).
; PLAN: r0=465(x1), r1=248(y1), r2=235(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 248
LDI r2, 235
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
