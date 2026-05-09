; DESCRIPTION: Draws a yellow line from (95, 146) to (112, 16).
; PLAN: r0=95(x1), r1=146(y1), r2=112(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 146
LDI r2, 112
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
