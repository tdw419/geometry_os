; DESCRIPTION: Draws a black line from (305, 97) to (231, 142).
; PLAN: r0=305(x1), r1=97(y1), r2=231(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 97
LDI r2, 231
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
