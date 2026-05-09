; DESCRIPTION: Draws a black line from (224, 212) to (279, 179).
; PLAN: r0=224(x1), r1=212(y1), r2=279(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 212
LDI r2, 279
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
