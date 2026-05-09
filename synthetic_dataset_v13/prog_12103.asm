; DESCRIPTION: Draws a yellow line from (95, 242) to (166, 174).
; PLAN: r0=95(x1), r1=242(y1), r2=166(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 242
LDI r2, 166
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
