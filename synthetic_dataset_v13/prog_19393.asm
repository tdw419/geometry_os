; DESCRIPTION: Draws a red line from (280, 242) to (90, 90).
; PLAN: r0=280(x1), r1=242(y1), r2=90(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 242
LDI r2, 90
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
