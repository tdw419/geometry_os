; DESCRIPTION: Draws a green line from (498, 227) to (275, 59).
; PLAN: r0=498(x1), r1=227(y1), r2=275(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 227
LDI r2, 275
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
