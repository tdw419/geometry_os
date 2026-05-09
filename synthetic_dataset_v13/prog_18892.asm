; DESCRIPTION: Draws a black line from (501, 126) to (128, 70).
; PLAN: r0=501(x1), r1=126(y1), r2=128(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 126
LDI r2, 128
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
