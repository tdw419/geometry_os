; DESCRIPTION: Draws a yellow line from (381, 146) to (79, 166).
; PLAN: r0=381(x1), r1=146(y1), r2=79(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 146
LDI r2, 79
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
