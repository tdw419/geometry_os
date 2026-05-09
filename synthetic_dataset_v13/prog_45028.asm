; DESCRIPTION: Draws a black line from (46, 163) to (265, 57).
; PLAN: r0=46(x1), r1=163(y1), r2=265(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 163
LDI r2, 265
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
