; DESCRIPTION: Draws a green line from (457, 226) to (174, 0).
; PLAN: r0=457(x1), r1=226(y1), r2=174(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 226
LDI r2, 174
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
