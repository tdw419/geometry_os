; DESCRIPTION: Draws a black line from (138, 30) to (487, 186).
; PLAN: r0=138(x1), r1=30(y1), r2=487(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 30
LDI r2, 487
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
