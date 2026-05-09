; DESCRIPTION: Draws a black line from (220, 158) to (236, 215).
; PLAN: r0=220(x1), r1=158(y1), r2=236(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 158
LDI r2, 236
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
