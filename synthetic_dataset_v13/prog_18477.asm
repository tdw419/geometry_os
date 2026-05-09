; DESCRIPTION: Draws a black line from (487, 166) to (218, 73).
; PLAN: r0=487(x1), r1=166(y1), r2=218(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 166
LDI r2, 218
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
