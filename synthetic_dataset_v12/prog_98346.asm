; DESCRIPTION: Draws a cyan line from (331, 166) to (137, 181).
; PLAN: r0=331(x1), r1=166(y1), r2=137(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 166
LDI r2, 137
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
