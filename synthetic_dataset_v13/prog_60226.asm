; DESCRIPTION: Draws a black line from (207, 249) to (16, 64).
; PLAN: r0=207(x1), r1=249(y1), r2=16(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 249
LDI r2, 16
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
