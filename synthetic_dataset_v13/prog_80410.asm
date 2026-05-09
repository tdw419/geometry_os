; DESCRIPTION: Draws a white line from (66, 212) to (240, 148).
; PLAN: r0=66(x1), r1=212(y1), r2=240(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 212
LDI r2, 240
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
