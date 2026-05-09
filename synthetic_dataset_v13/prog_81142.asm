; DESCRIPTION: Draws a black line from (275, 194) to (161, 171).
; PLAN: r0=275(x1), r1=194(y1), r2=161(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 194
LDI r2, 161
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
