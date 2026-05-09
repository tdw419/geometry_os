; DESCRIPTION: Draws a red line from (11, 242) to (300, 143).
; PLAN: r0=11(x1), r1=242(y1), r2=300(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 242
LDI r2, 300
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
