; DESCRIPTION: Draws a red line from (146, 102) to (207, 242).
; PLAN: r0=146(x1), r1=102(y1), r2=207(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 102
LDI r2, 207
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
