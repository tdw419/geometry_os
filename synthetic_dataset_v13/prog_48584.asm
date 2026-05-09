; DESCRIPTION: Draws a red line from (215, 224) to (374, 100).
; PLAN: r0=215(x1), r1=224(y1), r2=374(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 224
LDI r2, 374
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
