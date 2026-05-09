; DESCRIPTION: Draws a red line from (296, 60) to (177, 242).
; PLAN: r0=296(x1), r1=60(y1), r2=177(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 60
LDI r2, 177
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
