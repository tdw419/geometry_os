; DESCRIPTION: Draws a black line from (256, 242) to (316, 187).
; PLAN: r0=256(x1), r1=242(y1), r2=316(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 242
LDI r2, 316
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
