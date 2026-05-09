; DESCRIPTION: Draws a red line from (191, 167) to (374, 242).
; PLAN: r0=191(x1), r1=167(y1), r2=374(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 167
LDI r2, 374
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
