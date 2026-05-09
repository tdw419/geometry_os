; DESCRIPTION: Draws a black line from (231, 237) to (156, 231).
; PLAN: r0=231(x1), r1=237(y1), r2=156(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 237
LDI r2, 156
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
