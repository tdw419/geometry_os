; DESCRIPTION: Draws a black line from (91, 163) to (275, 103).
; PLAN: r0=91(x1), r1=163(y1), r2=275(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 163
LDI r2, 275
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
