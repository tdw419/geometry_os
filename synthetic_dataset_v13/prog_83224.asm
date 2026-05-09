; DESCRIPTION: Draws a green line from (148, 146) to (166, 29).
; PLAN: r0=148(x1), r1=146(y1), r2=166(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 146
LDI r2, 166
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
