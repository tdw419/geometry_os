; DESCRIPTION: Draws a green line from (364, 235) to (40, 231).
; PLAN: r0=364(x1), r1=235(y1), r2=40(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 235
LDI r2, 40
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
