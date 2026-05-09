; DESCRIPTION: Draws a black line from (281, 224) to (491, 215).
; PLAN: r0=281(x1), r1=224(y1), r2=491(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 224
LDI r2, 491
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
